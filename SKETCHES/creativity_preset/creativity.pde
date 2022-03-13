//A.H
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer audio;
boolean fade = true;
boolean pause = false;
float rAngle = random(0.1, 30);
float rStroke = random(0, 255);
float rStrokeSize = random(0.25, 3);
float rWaveMap = random(2000, 10000);
int bands = 256; // must be multiple of two
float[] spectrum = new float[bands];
float[] sum = new float[bands];
int musicRandomizer = int(random(1,4));
FFT fft;
Particle[] particles;
void setup() {
  colorMode(HSB, 360, 60, 60, 60);
  //size(1080, 1080, P3D);
  fullScreen(P3D);
  smooth(8);
  frameRate(50);
  //AUDIO PROCESSING DONE HERE.
  minim = new Minim(this);
  if(musicRandomizer == 1){
    audio = minim.loadFile("Limitless.mp3");
  }
  else if(musicRandomizer == 2){
    audio = minim.loadFile("TakingFlight.mp3");
  }
  else{
    audio = minim.loadFile("Triumph.mp3");
  }
  audio.loop();
  fft = new FFT(audio.bufferSize(), audio.sampleRate() );
  fft.linAverages(bands);
  particles = new Particle[fft.specSize()];
  for (int i = 0; i < fft.specSize(); i++) {
    particles[i] = new Particle(i);
  }
}

void draw() {
  background(0);
  pushStyle();
  colorMode(RGB, 360);
  if (fade) {
    noStroke();
    fill(0, 25);
    rect(0, 0, width, height);
  } else {
    background(0);
  }
  popStyle();
  fft.forward(audio.mix);
   for (int i = 0; i < fft.specSize() - 1; i++) {
    particles[i].update(fft.getBand(i), audio.mix.get(i*2));
    particles[i].render();
    particles[i].render();
  }
 // hint(ENABLE_STROKE_PURE);
  //for a wave function, -1 - 0 -  1
  float wave = sin(radians(frameCount));
  fft.forward(audio.mix);
  translate(width/2, height/2);
  float w =  wave*map(rWaveMap, 0, height, 500, 0);
  for (int i = 0; i < fft.specSize() - 1; i++) {
    //rotate(rAngle);
    //rotate(0.8); //0.1, 0.9 look good too.
    rotate(2.1);
    stroke(#F7FAF8); //WHITE
    line(850, i-w/2, -850, i++);
    strokeWeight(map(wave, -1, 1, 0.5, rStrokeSize));
    stroke(#FFD321); //YELLOW/ORANGE
    strokeWeight(map(wave, -1, 1, 0.5, rStrokeSize));
    line(-850, -i+w, 550, i++);
    stroke(#2BFC5A); //GREEN
    line(-850, i-w, 850, i++);
    //particles[i].update(fft.getBand(i), audio.mix.get(i*2));
    //particles[i].render();
  }

}
class Particle {
  PVector loc;
  PVector vel;

  float radius;
  float h;
  float s;
  float b;

  Particle(int id) {
    loc = new PVector(map(id, 0, fft.specSize(), 0, width), height/2);
    vel = new PVector(random(-1, 1), random(-1, 1));

    h = map(id, 0, fft.specSize(), 0, 360);
    s = 100;
    b = 100;
  }

  void update(float _r, float _b) {
    loc.add(vel);

    if (loc.x < 0 || loc.x > width) {
      vel.x *= -1;
    }

    if (loc.y < 0 || loc.y > height) {
      vel.y *= -1;
    }

    radius = _r;
    radius = constrain(radius, 2, 100);

    b = map(_b, -1, 1, 0, 200);
  }

  void render() {
    stroke(h, s, b, 50);
    fill(h, s, b, 50);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
}
