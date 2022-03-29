public class ControlPanel {
  ControlP5 cp5;
  Visualizer visualizer;

  int windowHeight;
  int windowWidth;
  int controlPanelWidth;
  int controlPanelPosX;
  int elementsPosX;
  int buttonWidth;

  //color dimColor = color(35,35,35);
  //color highlightColor = color(0,151,244);
  
  color dimColor = color(#000000);
  color highlightColor = color(0,150,250);

  public ControlPanel(Visualizer visualizer, int windowHeight, int windowWidth, int controlPanelWidth, ControlP5 cp5) {
    this.visualizer = visualizer;
    this.cp5 = cp5;

    this.windowHeight = windowHeight;
    this.windowWidth = windowWidth;
    this.controlPanelWidth = controlPanelWidth;

    controlPanelPosX = this.windowWidth - this.controlPanelWidth;
    elementsPosX = controlPanelPosX + 30;
    buttonWidth = (controlPanelWidth - 75) / 2; // Half of element width - margin(15)

    cp5.setFont(new ControlFont(createFont("Arial", 10),10));

    // AmplitudeMagnitude
    cp5.addSlider("amplitude")
      .setLabel("")
      .setColorForeground(highlightColor)
      .setColorActive(highlightColor)
      .setColorBackground(dimColor)
      .setHeight(10)
      .setPosition(controlPanelPosX + 30, 160)
      .setRange(0, 1)
      .setWidth(controlPanelWidth - 60) // 2x margin
      .setValue(0.40); // Default

    // FrequencyMagnitude
    cp5.addSlider("frequency")
      .setLabel("")
      .setColorActive(highlightColor)
      .setColorForeground(highlightColor)
      .setColorBackground(dimColor)
      .setHeight(10)
      .setPosition(controlPanelPosX + 30, 255)
      .setRange(0, 1)
      .setWidth(controlPanelWidth - 60) // 2x margin
      .setValue(0.50); // Default
      
          //red color
    cp5.addSlider("redcolor")
      .setLabel("")
      .setColorActive(highlightColor)
      .setColorForeground(highlightColor)
      .setColorBackground(dimColor)
      .setHeight(10)
      .setPosition(controlPanelPosX + 30, 370)
      .setRange(0, 255)
      .setWidth(controlPanelWidth - 500) // 2x margin
      .setValue(100); // Default
      
     cp5.addSlider("greencolor")
      .setLabel("")
      .setColorActive(highlightColor)
      .setColorForeground(highlightColor)
      .setColorBackground(dimColor)
      .setHeight(10)
      .setPosition(controlPanelPosX + 240, 370)
      .setRange(0, 255)
      .setWidth(controlPanelWidth - 500) // 2x margin
      .setValue(100); // Default
      
      
    cp5.addSlider("bluecolor")
      .setLabel("")
      .setColorActive(highlightColor)
      .setColorForeground(highlightColor)
      .setColorBackground(dimColor)
      .setHeight(10)
      .setPosition(controlPanelPosX + 450, 370)
      .setRange(0, 255)
      .setWidth(controlPanelWidth - 500) // 2x margin
      .setValue(100); // Default

    // Visualization
    RadioButton radioButton = cp5.addRadioButton("radioButton");
    radioButton
        .setColorBackground(dimColor)
        .setPosition(elementsPosX, 450)
        .setColorForeground(#2B2B2B)
        .setColorActive(highlightColor)
        .setSize(25, 25)
        .setItemsPerRow(1)
        .setSpacingRow(10)
        .setLabelPadding(20, 20)
        .addItem("Welcome", 0)
        .addItem("Function # 1", 1)
        .addItem("Function # 2", 2)
        .addItem("Function # 3", 3)
        .activate(0);
  
    DropdownList droplist = cp5.addDropdownList("Music Changer");
    droplist
        .setColorBackground(dimColor)
        .setPosition(elementsPosX+200, 460)
        .setColorForeground(#2B2B2B)
        //.setSize(120,25)
        .setColorActive(highlightColor)
        .setOpen(false)
        .addItem("Choice # 1", 1)
        .addItem("Choice # 2", 2)
        .addItem("Choice # 3", 3)
        .addItem("Choice # 4", 4)
        .addItem("Choice # 5", 5);
    // Buttons
    Button pause = cp5.addButton("pause");
    pause
      .activateBy(ControlP5.RELEASE)
      .setLabel("Pause")
      .setColorActive(highlightColor)
      .setColorBackground(highlightColor)
      .setColorForeground(highlightColor)
      .setPosition(elementsPosX, windowHeight - 130) // 60(margin) - 40(height)
      .setSize(buttonWidth, 40)
      .setValue(128);
    Button reset = cp5.addButton("reset");
    reset
      .activateBy(ControlP5.RELEASE)
      .setLabel("Reset")
      .setColorActive(highlightColor)
      .setColorBackground(highlightColor)
      .setColorForeground(highlightColor)
      .setPosition(elementsPosX + buttonWidth + 15, windowHeight - 130) // 60(margin) - 40(height)
      .setSize(buttonWidth, 40)
      .setValue(128);

    // Button style
    Label pauseLabel = pause.getCaptionLabel();
    pauseLabel.align(CENTER, CENTER);

    Label resetLabel = reset.getCaptionLabel();
    resetLabel.align(CENTER, CENTER);
  }


  public void draw() {

    // Background
    //fill(49, 49, 49);
    fill(60,60,60);
    rect(controlPanelPosX, 0, controlPanelWidth, windowHeight);

    /* Text (margin: 60, 30) */

    // Title
    textAlign(CENTER);
    textSize(24);
    fill(255, 255, 255);

    text("K-WAi-audioVisualizer", controlPanelPosX + (controlPanelWidth/2), 60);

    // Subhead
    textAlign(LEFT);
    fill(206, 206, 206);

    textSize(16);
    text("Amplitude Magnifier", elementsPosX, 120);
    textSize(12);
    text("Magnify the amplitude of the audio", elementsPosX, 140);

    textSize(16);
    text("Frequency Magnifier", elementsPosX, 215);
    textSize(12);
    text("Magnify the frequency of the audio", elementsPosX, 235);


    textSize(16);
    text("Color Selector", elementsPosX, 315);
    textSize(12);
    text("Change the color of the visualizations!", elementsPosX, 335);
    
    textSize(14);
    fill(255,0,0);
    text("RED",elementsPosX+50,365);
    
    fill(0,255,0);
    text("GREEN", elementsPosX+250,365);
    
    fill(0,0,255);
    text("BLUE", elementsPosX+470, 365);
    
    
    fill(#FFFFFF);
    textSize(16);
    text("Visualization Selector", elementsPosX, 410);
    textSize(12);
    text("Visualize music", elementsPosX, 435);
    
    textSize(16);
    text("Music Selector",elementsPosX + 200, 410);
    textSize(12);
    text("Pick the music of your choice", elementsPosX + 200, 435);

    textSize(16);
    text("Instructions", elementsPosX, 610);
    textSize(12);
    text("- INSERT INSTRUCTION 1 HERE", elementsPosX, 630);
    text("- INSERT INSTRUCTION 2 HERE", elementsPosX, 650);
    text("- INSERT INSTRUCTION 3 HERE", elementsPosX, 670);
    text("- INSERT INSTRUCTION 4 HERE", elementsPosX, 690);
    text("- INSERT INSTRUCTION 5 HERE", elementsPosX, 710);

  }

  /* Updates values without needing refresh */
  public void mouseEvent() {
    float amplitudeMagnitude = cp5.get(Slider.class, "amplitude").getValue();
    float frequencyMagnitude = cp5.get(Slider.class, "frequency").getValue();
    float visualizationIndex = cp5.get(RadioButton.class, "radioButton").getValue();
    float redcolor = cp5.get(Slider.class, "redcolor").getValue();
    float greencolor = cp5.get(Slider.class, "greencolor").getValue();
    float bluecolor = cp5.get(Slider.class, "bluecolor").getValue();
    visualizer.update(amplitudeMagnitude, frequencyMagnitude, visualizationIndex, redcolor, greencolor, bluecolor);
  }
}
