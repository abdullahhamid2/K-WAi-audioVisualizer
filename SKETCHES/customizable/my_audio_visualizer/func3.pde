public class func3{
int ranges = 100;
public void draw() {
  background(0);
  noFill();
  //fill(redcolor, greencolor, bluecolor);
  strokeWeight(2);

  for (int i = 0; i < ranges; i++) {
    float paint = map(i, 0, ranges, 0, 255);
    stroke(paint);    
    beginShape();
    for (int x = -10; x < width - controlPanelWidth; x += 20) {
            fill(redcolor, greencolor, bluecolor);
            float n = noise(x * 0.001, i * 0.01, frameCount * 0.02);
            float y = map(n, 0, 1, 0, height);
            vertex(x, y);
    }
    endShape();
    
  }
  
}
}
