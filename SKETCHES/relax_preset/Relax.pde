//Ameer: this is the relax preset with waves
//float gl = round(sin(radians(i+150)) * (15*round(height / 100)) + (height * 3/4) - (round(sin(radians(150)))));
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float fps = 30; 
float smoothingFactor = 0.25;
AudioPlayer player;
FFT fft;
Minim minim;
int bands = 256; // must be multiple of two
float[] spectrum = new float[bands];
float[] sum = new float[bands];
float unit;
int groundLineY;
int sphereRadius;
float spherePrevX;
float spherePrevY;
int yOffset;
boolean initialStatic = true;
float[] extendingSphereLinesRadius;
PVector center;
float var1;
float var2;
//Main Setup:
void settings() {
  size(1080, 1080, P3D);
  smooth(8);
}

void setup() {
  frameRate(fps);
  unit = height / 100; 
  groundLineY = height * 3/4; 
  center = new PVector(width / 2, height * 3/4);
  minim = new Minim(this);
  player = minim.loadFile("ThetaAlpha.mp3", 2048);
  player.loop();
  fft = new FFT( player.bufferSize(), player.sampleRate() );
  fft.linAverages(256);
  //noCursor();
  background (0);
}

void drawStatic(){
  if (initialStatic) {
    extendingSphereLinesRadius = new float[241];
 
    for (int angle = 0; angle <= 240; angle += 7) {
      extendingSphereLinesRadius[angle] = map(random(1), 0, 1, sphereRadius, sphereRadius * 7);
    }
 
    initialStatic = false;
  }
  
  for (int angle = 0; angle <= 240; angle += 1.5) {
    float x = round(cos(radians(angle + 150)) * sphereRadius + center.x);
    float y = round(sin(radians(angle + 150)) * sphereRadius + groundLineY - yOffset);
    float xDestination = x;
    float yDestination = y;
  
  for (int i = sphereRadius; i <= extendingSphereLinesRadius[angle]; i++) {
      float x2 = cos(radians(angle + 150)) * i + center.x;
      float y2 = sin(radians(angle + 150)) * i + groundLineY - yOffset;
 
      if (y2 <= getGroundY(x2)) { // Make sure it doesn't go into ground
        xDestination = x2;
        yDestination = y2;
      }
    }
  stroke(255);
  //if (y <= getGroundY(x)) line(x, y, xDestination, yDestination);
  }   
}


//curves:
void drawAll(float[] sum) {
  sphereRadius = 15 * round(unit);
  spherePrevX = 0;
  spherePrevY = 0;
  yOffset = round(sin(radians(150)) * sphereRadius);
  drawStatic();
  float x = 0;
  float y = 0;
  int surrCount = 1;
  boolean direction = false;
  while (x < width * 1.5 && x > 0 - width / 2){
    float surroundingRadius;
    float surrRadMin = sphereRadius + sphereRadius * 1/2 * surrCount;
    float surrRadMax = surrRadMin + surrRadMin * 1/8;
    float surrYOffset;
    float addon = frameCount * 1.5;
    if(direction) addon = addon * 1.5;
    
    //player.bufferSize() - 1 dancing circular waves in the back
    for (float angle = 0; angle <= 240; angle += 1.5){
      surroundingRadius = map(sin(radians(angle * 7 + addon)), -1, 1, surrRadMin, surrRadMax); // Faster rotation through angles, radius oscillates
      surrYOffset = sin(radians(150)) * surroundingRadius;
      x = round(cos(radians(angle + 150)) * surroundingRadius + center.x);
      y = round(sin(radians(angle + 150)) * surroundingRadius + getGroundY(x) - surrYOffset);
      noStroke();
      fill(map(surroundingRadius, surrRadMin, surrRadMax, 100, 255));
      if( angle % 2 == 0) {
        fill(#00ffbf , 200);//cool green
        circle(x, y, 3* unit / 10.24);
      } else {
        fill(#00ffff, 200); //cool blue
        circle(x, y, 3* unit / 10.24);
      }
      //noFill();
    }
    
    //sound sphere in the middle:
    //241 or player.bufferSize() - 1
    for (int i = 0; i < player.bufferSize() - 1; i++){
      float angle = sin(i+var1)* 10; 
      float angle2 = sin(i+var2)* 300; 
      //float x = sin(radians(i))*(angle2+30); 
      //float y = cos(radians(i))*(angle2+30);
      float x3 = sin(radians(i))*(500/angle); 
      float y3 = cos(radians(i))*(500/angle);
      fill (#00ffff, 90); //blue
      ellipse(x3+540, y3+650, player.right.get(i)*30, player.left.get(i)*30);
      
    }
    
    direction = !direction;
    surrCount += 1;
    
    // Ground line
    for (int groundX = 0; groundX <= width; groundX++) {
      float groundY = getGroundY(groundX);
      noStroke();
      //fill(255);
      if(groundX % 2 == 0){
        fill(#ffffff , 200);
        circle(groundX, groundY, 1.8 * unit / 10.24);
      } else {
        fill(#00ffff , 200);
        circle(groundX, groundY+20, 1.8 * unit / 10.24);
      }
      groundY = getGroundY2(groundX);
      fill(#00ffbf , 200);
      circle(groundX, groundY+30, 1.8 * unit / 10.24);
      //noFill();
    }
  }
}


  // Get the Y position at position X of ground sine wave
float getGroundY(float groundX) {
  float angle = 1.1 * groundX / unit * 10.24;
  float groundY = sin(radians(angle + frameCount * 2)) * unit * 1.25 + groundLineY - unit * 1.25;
  return groundY;
}

float getGroundY2(float groundX) {
  float angle = 1.1 * groundX / unit * 10.24;
  float groundY = cos(radians(angle + frameCount * 2)) * unit * 1.25 + groundLineY - unit * 1.25;
  return groundY;
}


void draw() {
  fft.forward(player.mix);
  spectrum = new float[bands];
  for(int i = 0; i < fft.avgSize(); i++){
    spectrum[i] = fft.getAvg(i) / 2;
    // Smooth the FFT spectrum data by smoothing factor
    sum[i] += (abs(spectrum[i]) - sum[i]) * smoothingFactor;
  }
 
  // Reset canvas
  fill(0);
  noStroke();
  rect(0, 0, width, height);
  noFill();
 
  drawAll(sum);
}
  
