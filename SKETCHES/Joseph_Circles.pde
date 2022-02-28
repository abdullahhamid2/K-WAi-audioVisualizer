import ddf.minim.*; 
 
Minim minim;
AudioPlayer player;
 
int _waveH = 400;  
int _fluctuationDepth = 200; 
float _noiseSeed;
int _alpha = 1;
float _colorTransion = 2;
float _initRadius =25;
 
void setup()
{
  size(750, 500);
  colorMode(HSB, 360, 100, 100, 255);
  background(333);
  minim = new Minim(this);
  player = minim.loadFile("Sam Smith - Fire on Fire.mp3", 1024);
  player.loop();
}
 
void draw()
{
  scrRefresh();
  _noiseSeed += 0.01;
 
  translate(width/2, height/2);
  pushMatrix();
  float xnoise = _fluctuationDepth*(noise(_noiseSeed)-0.5);
  float ynoise = _fluctuationDepth*(noise(_noiseSeed)-0.5);   
  translate(xnoise-player.left.size()/2, ynoise);
  for (int i=0; i< player.left.size()-1; i+=random(10,40)) {
    noStroke();
    fill((frameCount*_colorTransion+80*(1-abs(player.mix.get(i)))-20)%360, 100, 70, 255);
    float radius = random(0, 10)+_initRadius*player.mix.get(i);
    ellipse(i, player.left.get(i)*_waveH, radius, radius);
  }
  popMatrix();
}
 
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
 
void scrRefresh() {
  fill(0, 0, 0, 5);
  noStroke();
  rect(0, 0, width, height);
}
