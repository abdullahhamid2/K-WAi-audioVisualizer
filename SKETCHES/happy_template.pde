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
  audio = minim.loadFile("mixkit-a-very-happy-christmas-897.mp3");    
  audio.loop();
}

void draw () {
  fill(0,50);  
  noStroke();  //Disables drawing the stroke (outline).
  rect(0, 0, width, height);
  translate(width/2, height/2);    //https://processing.org/reference/translate_.html
  
  int size = audio.bufferSize();
  
  // temporary solution to randomizing lengths of lines/shapes
  
  Random rand = new Random();
  int randomNum = rand.nextInt((700-200)+1)+200;
  
  // BeatDetect drawing stuff
  
  beat.detect(audio.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  fill(60, 255, 0, a);
  if ( beat.isOnset() ) eRadius = 100;
  
  fill(204, 102, 0);
  ellipse(0, 0, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;

  // regular for loop patterns
  
  for (int i = 0; i < size - 1; i++) {
    float angle = sin(i+var1) * 10;
    float angle2 = sin(i+var2) * 300;
    
    float x = sin(radians(i)*(1000/angle));
    float y = cos(radians(i)*(1000/angle));
  
    float x2 = sin(radians(i)*(1500/angle));
    float y2 = cos(radians(i)*(1500/angle));
    
    float x3 = sin(radians(i)*(600/angle));
    float y3 = cos(radians(i)*(600/angle));

    
// YELLOW, WHITE AND ORANGE
    color yellow = color(255, 204, 0);
    fill (yellow, 90); //yellow
    circle(x, y, audio.right.get(i)*50);
 
    fill (#FEF1E6, 90); // off white
    circle(x3, y3, audio.right.get(i)*30);
 

   for (int j = i; j > 0; j = j - 100) {
     stroke(#FFB085); // pastel orange
     line(x2, x2 * audio.right.get(i) * 100, y2, y2 * audio.left.get(i));
     line(x2 * audio.right.get(i) * 100, x2 , y2 * audio.left.get(i), y2);
   }
 

  }
  
  var1 += 0.01;
  var2 += 0.05;
 
}
