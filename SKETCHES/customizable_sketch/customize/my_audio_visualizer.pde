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
int n = 0;
//var spectrum = fft.analyze(); // This is what gives us the shape
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
  size(displayWidth, displayHeight, P3D);

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
  float redcolor;
  float bluecolor;
  float greencolor;
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
        //fill(0, 0, 0);
        background(0);
        function1();
        break;
      case 1:
     //fill(0, 0, 0);
     background(0);
        function2();
        break;
      case 2:
      background(0);
        function3();
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
    fill(0, 0, 0, 10);
    rect(0, 0, visualizerWidth, height);

    // Declarations & Instantiations
    int margin = 80;
    int startingDivisor = 5;

    adjustedAmplitudeMagnitude = amplitudeMagnitude * 800; // Max 800
    adjustedFrequencyMagnitude = frequencyMagnitude * 800; // Max 800

    // Visualization
    for(int i = 0; i < fft.specSize(); i++){
      fill(random(0, 255), random(0, 255), random(0, 255));
      circle(margin * i, height - fft.getBand(i) * adjustedFrequencyMagnitude - height/startingDivisor,
        (input.left.get(i) + input.right.get(i)) * adjustedAmplitudeMagnitude);
      rect(margin+50 * i,  height-fft.getBand(i) * adjustedFrequencyMagnitude - height/startingDivisor, input.left.get(i) * adjustedAmplitudeMagnitude, input.right.get(i) * adjustedAmplitudeMagnitude);
    }
  }
  
    private void function3(){
    //TO-DO
    fill(redcolor, greencolor, bluecolor);
    ellipse(1000, 1000,100,100);
  }
  
    private void function4(){
    
    //TO-DO
  }
  
  
  public void update(float amplitudeMagnitude, float frequencyMagnitude, float visualizationIndex, float redcolor, float greencolor, float bluecolor) {
    this.amplitudeMagnitude = amplitudeMagnitude;
    this.frequencyMagnitude = frequencyMagnitude;
    this.visualizationIndex = (int) visualizationIndex;
    this.redcolor = redcolor;
    this.greencolor = greencolor;
    this.bluecolor = bluecolor;
  }
}
