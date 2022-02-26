//TEMPLATE
//We're importing the Libraries

//https://processing.org/reference/    <- Useful functions/references 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer audio;


//GLOBAL VARIABLES DEFINED HERE
int bands = 256; // must be multiple of two
float[] spectrum = new float[bands];
float[] sum = new float[bands];
//MAIN SETUP FOR THE VISUALIZER.

void setup () {
  size(1080, 1080, P3D);  //YOU CAN CHANGE THE RESOLUTION HERE. I THINK YOU DO NEED P3D Though
  smooth(8);
  noCursor();
  background (0);
  //framerate of 24 works best for me, you can try for yourself.
  frameRate(24);
 
//AUDIO PROCESSING DONE HERE.
  minim = new Minim(this);
//CHANGE THE NAME OF THE AUDIO FILE.
  audio = minim.loadFile("kitty.mp3");    
//YOU CAN EITHER DO audio.loop() or audio.play()
  audio.loop();
//FFT INSTANTIATED HERE
  fft = new FFT(audio.bufferSize(), audio.sampleRate() );
  fft.linAverages(bands);
}
 
//HERE WE DEFINE OUR VISUALIZATION FUNCTION
void draw () {
 
}
