import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import java.util.Random;
Minim minim;
AudioPlayer audio;
BeatDetect beat;

float var1;
float var2;
float eRadius;


//MAIN SETUP

void setup () {
  size(1080, 1080, P3D);
  smooth(8);
  noCursor();
  background (0);
  frameRate(30);  
  
  //experimenting with BeatDetect
  beat = new BeatDetect();
  ellipseMode(RADIUS);
  eRadius = 20;
   
//AUDIO PROCESSING DONE HERE.
  minim = new Minim(this);
  audio = minim.loadFile("summer-happy.mp3");    
  audio.loop();
}

void draw () {
  fill(0,50);  
  noStroke();  //Disables drawing the stroke (outline).
  rect(0, 0, width, height);
  translate(width/2, height/2);    //https://processing.org/reference/translate_.html
  
  int size = audio.bufferSize();
  
  
  // BeatDetect drawing stuff
  
  beat.detect(audio.mix);
  if ( beat.isOnset() ) eRadius = 100;
  
  
  fill(204, 102, 0);
  ellipse(0, 0, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;

  // regular for loop patterns
  
  for (int i = 0; i < size - 1; i++) {
    float angle = sin(i+var1) * 10;
    
    float x = sin(radians(i)*(1000/angle));
    float y = cos(radians(i)*(1000/angle));
    
    float x3 = sin(radians(i)*(600/angle));
    float y3 = cos(radians(i)*(600/angle));

    float x4 = sin(radians(i))*(1250/angle); 
    float y4 = cos(radians(i))*(1250/angle);
    
    float x5 = sin(radians(i))*(1400/angle); 
    float y5 = cos(radians(i))*(1400/angle);
    
// YELLOW, WHITE AND ORANGE
    fill (#FFE162, 90); //yellow
    circle(x, y, audio.right.get(i)*100);
 
    fill (#fff8e5, 80); // off white
    circle(x3, y3, audio.right.get(i));
    
    fill (#FFB085, 100); // pastel orange
    circle(x4, y4, audio.right.get(i)*20);
    
    for (int j = i; j > 0; j = j - 100) {
    fill (#FFF8E5, 50); // white
    circle(x5, y5, audio.right.get(i)*10);
   }
 
  }
  
  var1 += 0.01;
  var2 += 0.05;
 
}
