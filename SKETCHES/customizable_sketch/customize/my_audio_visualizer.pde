import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.FFT;
import controlP5.*;
import processing.sound.*;



PImage img;
Visualizer visualizer;
ControlPanel controlPanel;

boolean colorchange = true;
func3 func3;

ControlP5 cp5;
Minim minim;
//GLOBAL VARIABLES, I KNOW, IT'S MESSY :P
int controlPanelWidth;
int windowHeight;
int windowWidth;
int visualizerWidth;
int numFrames=100;
FFT fft;
//inputInput input;
AudioPlayer input;
boolean fade = true;
boolean go = true;
int ranges = 0;
int n = 0;
float incr1; 
float incr2;
float limit;
float h;
PFont myFont1;
float redcolor;
float bluecolor;
float greencolor;
PFont myFont2;
//Particle[] particles;
int bands = 256;

PathFinder[] paths;

public void setup() {
  //fullScreen(P3D);
  //size(1080,1080,P3D);
  size(displayWidth, displayHeight, P3D);
  background(25);
  cp5 = new ControlP5(this);
  System.out.println("Reset!");
  windowHeight = displayHeight;
  windowWidth = displayWidth;
  controlPanelWidth = displayWidth / 4;
  visualizerWidth = (displayWidth - controlPanelWidth);
  minim = new Minim(this);
  input = minim.loadFile("Limitless.mp3");
  input.play();
  //colorMode(HSB, 360, 100, 100, 100);
  noiseSeed(98);
  smooth();
  incr2 = TWO_PI/100 ;
  h = random(360);
  fft = new FFT(input.bufferSize(), input.sampleRate());
  fft.linAverages(bands);
  
  
  
  
  
  //particles = new Particle[fft.specSize()];
  //for (int i = 0; i < fft.specSize(); i++) {
  //  particles[i] = new Particle(i);
  //}
  img = loadImage("kwai_logo.jpg");
  visualizer = new Visualizer(windowHeight, windowWidth, visualizerWidth);
  controlPanel = new ControlPanel(visualizer, windowHeight, windowWidth, controlPanelWidth, cp5);
  func3 = new func3();
    
  paths = new PathFinder[1];
  paths[0] = new PathFinder();
  // Listens for ControlP5 events
  cp5.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      // event.getAction() == 1 for click
      if(event.getController().getName() == "pause" && event.getAction() == 1) {
        go = !go;
        input.pause();
        cp5.getController("pause").setCaptionLabel(go ? "Pause" : "Unpause");
        System.out.println(go);
        if(go == true){
          input.play();
        }
      } else if (event.getController().getName() == "reset" && event.getAction() == 1) {
        cp5.getController("amplitude").setValue(0.40);
        cp5.getController("frequency").setValue(0.50);
        cp5.getController("redcolor").setValue(100);
        cp5.getController("greencolor").setValue(100);
        cp5.getController("bluecolor").setValue(100);
        
      }
    }
  });
}
public void draw() {
  if(go) {
    visualizer.draw();
    controlPanel.draw();
  } else {
 
  }

}

void mouseReleased() {

  controlPanel.mouseEvent();
}
void stop() {
  super.stop();
}

public class Visualizer{
  float amplitudeMagnitude = 0.4; // Default
  float frequencyMagnitude = 0.5; // Default
  float adjustedAmplitudeMagnitude;
  float adjustedFrequencyMagnitude;
  float amplitude;
  float frequency;

  int visualizationIndex = 0; // Default
  int windowHeight;
  int windowWidth;
  int visualizerWidth;
  int time;
  int wait = 100;

  float[] angle;
  float[] y, x;

  int color1 = 0;
  int color2 = 255;
  int color3 = 255;

  public Visualizer(int windowHeight, int windowWidth, int visualizerWidth) {
    this.windowHeight = windowHeight;
    this.windowWidth = windowWidth;
    this.visualizerWidth = visualizerWidth;
    time = millis(); // Current time
  }

  public void draw() {
    fft.forward(input.mix);
    //noStroke();
    img = loadImage("kwai_logo.jpg");
  //  pushStyle();
  //  colorMode(RGB, 360);   //REMOVE THIS OR NAH?
  //  if(fade) {
  //    noStroke();
  //    fill(0, 25);
  //    rect(0, 0, width, height);
  //} else {
  //  background(0);
  //}
  //popStyle();
  //fft.forward(input.mix);
    switch(visualizationIndex) {
      case 0:
        //fill(0, 0, 0);
        background(0);
        function1();
        break;
      case 1:
     //fill(0, 0, 0);
        //background(0);
        background(36);
        ellipseMode(CENTER);
        fill(255, 40);
        noStroke();
        smooth();
        function2();
        break;
      case 2:
      background(0);
        func3.draw();
        break;
      case 3:
      //fill(0, 0, 0);
      background(0);
        function4();
        break;
      default:
      background(0);
      function1();
    }
  }
  
  private void function1(){
  background(color(5,10,25));
  myFont1 = createFont("Lucida Calligraphy Italic", 32);
  myFont2 = createFont("Segoe Print", 32);
  textFont(myFont1,35);
  fill(255);
  textAlign(CENTER);
  text("Team",345,45);
  textFont(myFont1,45);
  text("K-Wai",345,85);
  textFont(myFont2,10);
  text("MEDITATION",345,100);
  textFont(myFont1,47);
  text("Audio",345,140);
  textFont(myFont2,65);
  text("Visualizer",345,205);
  stroke(255);
  strokeWeight(4);
  line(300,217,400,217);
  line(315,227,385,227);
  line(330,237,370,237);
  strokeWeight(1);
  line(305,93,313,93);
  line(295,96,313,96);
  line(305,99,313,99);
  line(376,93,385,93);
  line(376,96,395,96);
  line(376,99,385,99);
  strokeWeight(3);
  point(270,150);
  point(275,150);
  point(280,150);
  point(285,150);
  point(290,150);
  point(295,150);
  point(300,150);
  point(305,150);
  point(310,150);
  point(315,150);
  point(320,150);
  point(325,150);
  point(330,150);
  point(335,150);
  point(340,150);
  point(345,150);
  point(350,150);
  point(355,150);
  point(360,150);
  point(365,150);
  point(370,150);
  point(375,150);
  point(380,150);
  point(385,150);
  point(390,150);
  point(395,150);
  point(400,150);
  point(405,150);
  point(410,150);
  point(415,150);
  point(420,150);
  point(425,150);
  point(430,150);
  //-----------------------------
  //background(20);
  //colorMode(RGB, 255, redcolor, greencolor, bluecolor);
  image(img, (displayWidth-controlPanelWidth)/3,0);
  h += .1;
  h = h % 360;
  limit =  map(mouseX, 0, width, PI/12, PI/7);
  fill(350);
  text(round(degrees(limit)), 15, 15);
  incr1 += 0.001;
  for (float r = incr2; r < TWO_PI; r += incr2 ) { // r = 0; in Java (rounding issue?) 
    float ns = noise(incr1+r);
    float rads = map(ns, 0, 1, -limit, limit);

    float x = (width/2) + (60 * cos(r));
    float y = height/2 + (60 * sin(r));

    float sw = 0;
    if (rads <= 0) sw = map(rads, 0, -limit/3, 2, 0.1);
    else sw = map(rads, 0, limit/3, 2, 0.1) ;
    strokeWeight(abs(sw));
    stroke(redcolor, greencolor, bluecolor );
    pushMatrix();
    translate(x-300, y);
    rotate(r + PI/2);
    arm(30, rads);
    popMatrix();
  }
}
void arm(float len, float rds) {
  if (len > 5) {
    line(0, 0, 0, -len);
    translate(0, -len);
    rotate(rds);  
    arm(len*.9, rds);
  }
}

public void function2(){
    //rect(0, 0, visualizerWidth, height);

    // Declarations & Instantiations
    float circleCount = 80;
    float centerPosX = visualizerWidth/2;
    float centerPosY = height/2;

    float diameter =  visualizerWidth * .04;
    float radius  = diameter/2;
    float circ =  PI * diameter;
    float smallDiameter = (circ / circleCount);

    float angle, x, y;

    adjustedAmplitudeMagnitude = amplitudeMagnitude * 1000; // Max 5000
    adjustedFrequencyMagnitude = frequencyMagnitude * 25; // Max 50
    amplitude = (input.mix.get(1) * adjustedAmplitudeMagnitude);
    frequency = (fft.getBand(1) * adjustedFrequencyMagnitude);
    
    
    if(colorchange){
         color1 = int(redcolor);
         color2 = int(greencolor);
         color3 = int(bluecolor);
         colorchange = false;
    }
    

    fill(color1, color2, color3);

    // Fill Change Over Time
    if(millis() - time >= wait) {
      color1 += 10;
      color2 -= 5;

      // Resets
      if(color1 >= 255) { color1 = 0; }
      if(color2 <= 0) { color2 = 255; }
      if(color3 <= 0) { color3 = 255; }

      time = millis(); // Updates time
    }

    // Visualization
    for(int i = 1; i <= circleCount; ++i) {
      angle = i * TWO_PI / circleCount;
      x = centerPosX + cos(angle) * radius * amplitude;
      y = centerPosY + sin(angle) * radius * amplitude;
      ellipse(x, y, smallDiameter * frequency, smallDiameter * frequency);
    }
  } //<>//
  
    private void function4(){
  //pushStyle();
  //colorMode(RGB, 360);   //REMOVE THIS OR NAH?
  //if (fade) {
  //  noStroke();
  //  fill(0, 25);
  //  rect(0, 0, width, height);
  //} else {
  //  background(0);
  //}
  //popStyle();
  //fft.forward(input.mix);
  //for (int i = 0; i < fft.specSize() - 1; i++) {
  //  particles[i].update(fft.getBand(i), input.mix.get(i*2));
  //  particles[i].render();
  //  particles[i].render();
  //}
    float angle,angle2,inc,waveX,waveY,a,x,y,w,x1,y1;
    float size;
    
    adjustedAmplitudeMagnitude = amplitudeMagnitude * 800; // Max 800
    adjustedFrequencyMagnitude = frequencyMagnitude * 800; // Max 800

    background(0);
    push();
    translate((width - controlPanelWidth) / 2, height / 2);
    rotate(frameCount * 0.002);
    for (int i = 0; i < 1200; i++) {
        angle = sin(i + frameCount * 0.002) * 10;
        angle2 = cos(i + frameCount * 0.004) * 650;

        inc = 85;
        waveX = map(sin(frameCount * 0.01), -1, 1, -inc, inc);
        waveY = map(cos(frameCount * 0.01), -1, 1, -inc, inc);

        a = -394;
        x = sin(radians(i)) * (angle2 + a) + waveX;
        y = cos(radians(i)) * (angle2 + a) + waveY;

        w = 860;
        x1 = sin(radians(i)) * (w / angle);
        y1 = cos(radians(i)) * (w / angle);
  
        fill(redcolor, greencolor, bluecolor);
        circle(x, y, 1);
        size = map(sin(i * frameCount * 0.0002), -1, 1, 0, 4);
        circle(x1, y1, size);
    }
    pop();
  }
  
  
  public void updateattributes(float amplitudeMagnitude, float frequencyMagnitude, float visualizationIndex) {
    this.amplitudeMagnitude = amplitudeMagnitude;
    this.frequencyMagnitude = frequencyMagnitude;
    this.visualizationIndex = (int) visualizationIndex;
    //this.redcolor = redcolor;
    //this.greencolor = greencolor;
    //this.bluecolor = bluecolor;
  }
}

//class Particle {
//  PVector loc;
//  PVector vel;

//  float radius;
//  float h;
//  float s;
//  float b;

//  Particle(int id) {
//    loc = new PVector(map(id, 0, fft.specSize(), 0, width), height/2);
//    vel = new PVector(random(-1, 1), random(-1, 1));

//    h = map(id, 0, fft.specSize(), 0, 360);
//    s = 100;
//    b = 100;
//  }

//  void update(float _r, float _b) {
//    loc.add(vel);

//    if (loc.x < 0 || loc.x > width) {
//      vel.x *= -1;
//    }

//    if (loc.y < 0 || loc.y > height) {
//      vel.y *= -1;
//    }

//    radius = _r;
//    radius = constrain(radius, 2, 100);

//    b = map(_b, -1, 1, 0, 200);
//  }

//  void render() {
//    stroke(h, s, b, 50);
//    fill(h, s, b, 50);
//    ellipse(loc.x, loc.y, radius*2, radius*2);
//  }
//}

class PathFinder {

  PVector location;
  PVector velocity;
  float diameter;
  

  PathFinder() {
    location = new PVector(visualizerWidth/3, displayHeight/2);
    velocity = new PVector(0, -2);
    diameter = 40;
  }
  
  PathFinder(PathFinder parent) {
    location = parent.location.get();
    velocity = parent.velocity.get();
    float area = PI*sq(parent.diameter/2);
    float newDiam = sqrt(area/2/PI)*2;
    diameter = newDiam;
    parent.diameter = newDiam;
  }

  public void update() {
    if (diameter>0.5) {
      location.add(velocity);
      PVector bump = new PVector(random(-1, 1), random(-1, 1));  // 随机生长方向
      bump.mult(0.1);
      velocity.add(bump);
      velocity.normalize();

      if (random(0, 1)<0.025) {
        paths = (PathFinder[]) append(paths, new PathFinder(this));
      }
    }
  }
}
