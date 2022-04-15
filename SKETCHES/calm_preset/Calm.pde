import processing.awt.PSurfaceAWT;
import java.awt.MouseInfo;
import java.awt.Point;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global variables: 
Minim minim;
AudioPlayer audio;
float var1;
float var2;
boolean isInFullscreen;
boolean dragging;
int dragX, dragY;
Button hide, full, close;
PSurfaceAWT awtSurface;
PSurfaceAWT.SmoothCanvas smoothCanvas;

void setup(){
  size(800, 600);
  noStroke();
  //fullScreen();
  //surface.setSize(1080,1080);
  ////noCursor(); 
  background(0);
  frameRate(30);
  smooth(8);
  awtSurface = (PSurfaceAWT)surface;
  smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().removeNotify();
  smoothCanvas.getFrame().setUndecorated(true);// Hide the window border
  smoothCanvas.getFrame().setLocation(100, 100);// Move the window
  smoothCanvas.getFrame().addNotify();
  surface.setResizable(true);
  
  // Menu Buttons
  hide = new Button(width - 115, -5, 40, 25, color(#ffff66), 5);
  full = new Button(width - 80, -5, 40, 25, color(#99ff66), 5);
  close = new Button(width - 45, -5, 50, 25, color(200, 0, 0), 5);
  
  //AUDIO PROCESSING DONE HERE.
  minim = new Minim(this);
  audio = minim.loadFile("ThetaAlpha.mp3");    
  audio.loop();
}

void draw(){
  dashboard();
  fill(#000000,50);  
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  
  int size = audio.bufferSize();
  for (int i = 0; i < size-1; i++) {
    
    float angle = sin(i+var1)* 10; 
    float angle2 = sin(i+var2)* 300; 

    float x = sin(radians(i))*(angle2+30); 
    float y = cos(radians(i))*(angle2+30);
    
    float x2 = sin(radians(i))*(800/angle); 
    float y2 = cos(radians(i))*(800/angle);

    float x3 = sin(radians(i))*(500/angle); 
    float y3 = cos(radians(i))*(500/angle);
    
    float x4 = sin(radians(i))*(1000/angle); 
    float y4 = cos(radians(i))*(1000/angle);
    
    float x5 = sin(radians(i))*(1500/angle); 
    float y5 = cos(radians(i))*(1500/angle);
    
// Blue and green variants to create a calm environment supported by our research:
    color blue = color(0, 153, 255);
    fill (blue, 90); //blue
    circle(x3, y3, audio.right.get(i)*10);
 
    fill ( #00ffbf, 90); //light green
    rect(x3, y3, audio.left.get(i)*20, audio.left.get(i)*10);

    fill (#3366ff, 70); //darker blue
    circle(x, y, audio.right.get(i)*10);
    
    fill( #00ffbf , 90); //light green
    rect(x3, y3, audio.right.get(i)*10, audio.right.get(i)*20);

    fill ( #00ffff  , 90); //blue
    circle(x2, y2, audio.right.get(i)*20);
    
    fill (#ffffff, 150); //white
    ellipse(x4, y4, audio.right.get(i)*30, audio.right.get(i)*30);
    
    fill (#66ffff, 90); //blue
    ellipse(x5,y5, audio.right.get(i)*30, audio.right.get(i)*30);
    
    fill( #00ffbf , 90); //light green
    circle(x3, y3, audio.right.get(i)*10);

}
var1 += 0.01;
var2 += 0.05;
}

void mousePressed(){
  if(hide.isMouseOver()){
    smoothCanvas.getFrame().toBack();// Hide window
  }
  if(full.isMouseOver()){
    isInFullscreen = !isInFullscreen;
    if(isInFullscreen){
      smoothCanvas.getFrame().setLocation(0, 0);
      smoothCanvas.getFrame().setSize(displayWidth, displayHeight);
    }else{
      smoothCanvas.getFrame().setLocation(100, 100);
      smoothCanvas.getFrame().setSize(1080, 1080);
    }
  }
  if(close.isMouseOver()){
    exit();// Close window
  }
  // Drag window
  if(mouseY < 20){
    dragging = true;
    dragX = mouseX;
    dragY = mouseY;
  }
}

void mouseDragged(){
  if(dragging){
    // Get mouse position and move the window
    Point mouse = MouseInfo.getPointerInfo().getLocation();
    smoothCanvas.getFrame().setLocation(mouse.x - dragX, mouse.y - dragY);
  }
}

void mouseReleased(){
  dragging = false;
}

void dashboard(){
  background(0);
  // Draw Menu Bar
  fill(0);
  rect(0, 0, width, 20);
  hide.display();
  full.display();
  close.display();
}

// Menu Button Class
class Button{
  int xpos, ypos;
  int sizeX, sizeY;
  color buttonColor;
  int borderRadius;
  
  Button(int x, int y, int sx, int sy, color c, int br){
    xpos = x;
    ypos = y;
    sizeX = sx;
    sizeY = sy;
    buttonColor = c;
    borderRadius = br;
  }
  
  void display(){
    fill(buttonColor);
    rect(xpos, ypos, sizeX, sizeY, borderRadius);
  }
  
  boolean isMouseOver(){
    if(mouseX > xpos && mouseX < xpos + sizeX && mouseY > ypos && mouseY < sizeY){
      return true;
    }
    return false;
  }
}
