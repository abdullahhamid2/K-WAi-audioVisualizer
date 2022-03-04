//A.H
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer audio;
boolean pause = false;
float rAngle = random(0.1, 30);
float rStroke = random(0, 255);
float rStrokeSize = random(0.25, 3);
int bands = 256; // must be multiple of two
float[] spectrum = new float[bands];
float[] sum = new float[bands];
FFT fft;
void setup(){
  size(1920,1080,P3D);
  smooth(8);
  frameRate(50);
  //AUDIO PROCESSING DONE HERE.
  minim = new Minim(this);
  audio = minim.loadFile("kitty.mp3");    
  audio.loop();
  fft = new FFT(audio.bufferSize(), audio.sampleRate() );
  fft.linAverages(bands);
}

void draw() {
  spirals();
}

//void mouseClicked()
//{
//  if (mouseButton == LEFT)
//  {
//    reset(false);
//  }
//  else if (mouseButton == CENTER)
//  {
//  }
//  else if (mouseButton == RIGHT)
//  {
//    //pause = !pause;
//    reset(true);
//  }
//}

//void reset(boolean keepHue)
//{

//  background(0);
//  stroke(255, 5);
//  pause = false;
//}


void spirals() {
  background(0);
  translate(width/2, height/2);
  hint(ENABLE_STROKE_PURE);
  //for a wave function, -1 - 0 -  1
  float wave = sin(radians(frameCount));
  float w =  wave*map(mouseX, 0, height, 2500, 0);
  for(int i = 0; i < 500; i++){
    rotate(rAngle);
    //stroke(rStroke);   //USE THIS FOR RANDOM
    stroke(#FA7D00); // ORANGE
    line(850, i-w/2, -850, i++);
    strokeWeight(map(wave, -1, 1, 0.5, rStrokeSize));
    //stroke(rStroke);  //USE THIS FOR RANDOM
    stroke(#0500B4); //BLUEISH
    strokeWeight(map(wave, -1, 1, 0.5, rStrokeSize));
    line(-850, -i+w, 550, i++);
    //stroke(rStroke, rStroke, 0);
    stroke(#D90EE8);//PURPLE
    line(-850, i-w, 850, i++);
  }
  
  
//  for(int i = 0; i < audio.bufferSize(); i++){
//    print("audio left = ", audio.left.get(i));
//    print("audio right = ", audio.right.get(i));
//    w =  wave*map(mouseX, 0, height, 2500, 0);
//    rotate(rAngle);
//    stroke(255);
//    line(audio.left.get(i) * 100, audio.left.get(i) * 100-w/2, -audio.left.get(i) * 100, i++);
//    strokeWeight(map(wave, -1 , 1, 0.5, rStrokeSize));
//    stroke(Math.abs(audio.left.get(i) * 255));
//    strokeWeight(map(wave, -1, 1, 0.5, rStrokeSize));
//    line(audio.right.get(i) * 100 , audio.right.get(i) * 100 + w, 500, i++);
//    stroke(Math.abs(audio.right.get(i) * 255), Math.abs(audio.right.get(i) * 255), 0);
//    line(-audio.left.get(i) * 100, audio.left.get(i) * 100 - w, audio.left.get(i) * 100, i++);
   
//}
}
