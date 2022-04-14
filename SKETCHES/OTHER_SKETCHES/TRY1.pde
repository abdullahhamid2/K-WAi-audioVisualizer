// Trying to come up with an example function to visualize the audio. Still learning :)
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

void setup () {
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
  audio = minim.loadFile("kitty.mp3");    
  audio.loop();
}
 
void draw () {
  fill(0,50);  
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
// YELLOW, WHITE AND ORANGE
    fill (#000000, 90); //yellow
    ellipse(x, y, audio.left.get(i)*10, audio.left.get(i)*10);
 
   fill ( #ffffff, 60); //wt
    rect(x3, y3, audio.left.get(i)*20, audio.left.get(i)*10);

    fill ( #ff9800  , 90); //orange
    rect(x, y, audio.right.get(i)*10, audio.left.get(i)*10);
    
   fill( #ffffff , 70); //wt
    rect(x3, y3, audio.right.get(i)*10, audio.right.get(i)*20);
    
//OTHER COLORS?
   // fill (127, 0, 0); //Dark RED?
   // ellipse(x, y, audio.left.get(i)*10, audio.left.get(i)*10);
 
   //fill (0,140,155); //cyan?
   // rect(x3, y3, audio.left.get(i)*20, audio.left.get(i)*10);

   // fill (247,161,0); //orange?
   // rect(x, y, audio.right.get(i)*10, audio.left.get(i)*10);
    
   //fill(185,2,161); //purple?
   // rect(x3, y3, audio.right.get(i)*10, audio.right.get(i)*20);

  }

  //var1 += 0.008;
  //var2 += 0.04;
  
  var1 += 0.01;
  var2 += 0.05;
 
}
