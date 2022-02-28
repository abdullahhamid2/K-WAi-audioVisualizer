import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer audio;


//LOOKINTO BeatDetect, PeasyCam => Can detect microphone? Can detect soundboard?
//var 1 and var 2 , global variables, are 
float var1;
float var2;
//MAIN SETUP

void setup() {
  //fullScreen(P3D);
  //size(1024, 768, P3D);
  size(1080, 1080, P3D);
  smooth(8);
  noCursor();
  background (0);
  //framerate of 60 feels weird. I wonder why?
  frameRate(24);
 
//AUDIO PROCESSING DONE HERE.
  minim = new Minim(this);
  audio = minim.loadFile("thetaAlpha.mp3");    
  audio.loop();
}
 
void draw () {
  
  fill(#666666,50);  
  //fill(256,50);    //LOOK INTO fill() Syntax. 
  noStroke();  //Disables drawing the stroke (outline).
  rect(0, 0, width, height);
  translate(width/2, height/2);    //https://processing.org/reference/translate_.html
  
  int size = audio.bufferSize();
  
  for (int i = 0; i < size - 1; i++) {
    float angle = sin(i+var1)* 10; 
    float angle2 = sin(i+var2)* 300; 

    float x = sin(radians(i))*(angle2+30); 
    float y = cos(radians(i))*(angle2+30);

    float x3 = sin(radians(i))*(500/angle); 
    float y3 = cos(radians(i))*(500/angle);
    
    float x2 = sin(radians(i))*(800/angle); 
    float y2 = cos(radians(i))*(800/angle);
    
    float x4 = sin(radians(i))*(1000/angle); 
    float y4 = cos(radians(i))*(1000/angle);
    
    float x5 = sin(radians(i))*(1500/angle); 
    float y5 = cos(radians(i))*(1500/angle);
    
// Blue and green variants
    color blue = color(0, 153, 255);
    fill (blue, 90); //blue
    circle(x3, y3, audio.right.get(i)*10);
 
    fill ( #00ffbf, 90); //light green
    rect(x3, y3, audio.left.get(i)*20, audio.left.get(i)*10);

    fill (#3366ff, 70); //darker blue
    circle(x, y, audio.right.get(i)*10);
    
    fill( #00ffbf , 90); //light green
    rect(x3, y3, audio.right.get(i)*10, audio.right.get(i)*20);

    fill ( #00ffff  , 90); //blue
    circle(x2, y2, audio.right.get(i)*20);
    
    fill (#ffffff, 70); //white
    ellipse(x4, y4, audio.right.get(i)*30, audio.right.get(i)*30);
    
    fill (#66ffff, 90); //blue
    ellipse(x5, y5, audio.right.get(i)*30, audio.right.get(i)*30);
    
    fill( #00ffbf , 90); //light green
    circle(x3, y3, audio.right.get(i)*10);

  }

  //var1 += 0.008;
  //var2 += 0.04;
  
  var1 += 0.01;
  var2 += 0.05;
 
}
