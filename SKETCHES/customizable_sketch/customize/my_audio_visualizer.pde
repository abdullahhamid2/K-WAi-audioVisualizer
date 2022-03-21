import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.FFT;
import controlP5.*;
import processing.sound.*;

Visualizer visualizer;
ControlPanel controlPanel;
ControlP5 cp5;
Minim minim;

int controlPanelWidth;
int windowHeight;
int windowWidth;
int visualizerWidth;
FFT fft;
//inputInput input;
AudioPlayer input;
boolean go = true;
float var1;
float var2;

void setup() {
  cp5 = new ControlP5(this);
  System.out.println("Reset!");
  windowHeight = displayHeight;
  windowWidth = displayWidth;
  controlPanelWidth = displayWidth / 4;
  visualizerWidth = (displayWidth - controlPanelWidth);
  minim = new Minim(this);
  input = minim.loadFile("Limitless.mp3");
  input.play();
  
  //FOR MIC
  //input = minim.getLineIn(Minim.STEREO, 512);
  
  fft = new FFT(input.bufferSize(), input.sampleRate());
  size(displayWidth, displayHeight);

  visualizer = new Visualizer(windowHeight, windowWidth, visualizerWidth);
  controlPanel = new ControlPanel(visualizer, windowHeight, windowWidth, controlPanelWidth, cp5);
  
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
      }
    }
  });
}
void draw() {
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
    noStroke();

    switch(visualizationIndex) {
      case 0:
        fill(0, 0, 0);
        function1();
        break;
      case 1:
     fill(0, 0, 0);
        function2();
        break;
      case 2:
        function3();
        break;
      case 3:
      fill(0, 0, 0);
        function4();
        break;
      default:
        function1();
    }
  }
  
  private void function1(){
    
    //TO-DO
    frameRate(60);
    fill(0, 0, 0);
    rect(0, 0, visualizerWidth, height);

    // Declarations & Instantiations
    int bars = 100;
    int margin = 20;

    adjustedAmplitudeMagnitude = amplitudeMagnitude * 4000; // Max 4000
    adjustedFrequencyMagnitude = frequencyMagnitude * 200; // Max 200

    // Visualization
    for (int i = 0; i < bars; i++) {
      // x, y, width, height
      fill(255, 127.5 + i, 255 - (2.5 * i), random(150, 200));
      rect(margin * i, 0, 10, abs(input.mix.get(i) * adjustedAmplitudeMagnitude));
    }
  }
  

private void function2(){
float a = 0.0;
float inc = TWO_PI/25.0;
float prev_x = 0, prev_y = 50, x, y;
translate(height/2,width/2);
for(int i=0; i<100; i=i+4) {
  x = i;
  y = 50 + sin(a) * 40.0;
  line(prev_x, prev_y, x, y);
  prev_x = x;
  prev_y = y;
  a = a + inc;
}    
  }
  
    private void function3(){
    
    //TO-DO
  }
  
    private void function4(){
    
    //TO-DO
  }
  
  
  public void update(float amplitudeMagnitude, float frequencyMagnitude, float visualizationIndex) {
    this.amplitudeMagnitude = amplitudeMagnitude;
    this.frequencyMagnitude = frequencyMagnitude;
    this.visualizationIndex = (int) visualizationIndex;
  }
}
