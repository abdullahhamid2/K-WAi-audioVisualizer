
////CREDIT TO WINTER TREE:
////https://openprocessing.org/sketch/592358
//public class tree{
//int numFrames=100;
//PathFinder[] paths;

//public void setup() {
//  fullScreen(P3D);
//  background(36);
//  ellipseMode(CENTER);
//  fill(255, 40);
//  noStroke();
//  smooth();

//  paths = new PathFinder[1];
//  paths[0] = new PathFinder();
//}

//public void draw() {
//  for (int j=0; j<8; j++) {
//    for (int i=0; i<paths.length; i++) {
//      PVector loc = paths[i].location;
//      float diam = paths[i].diameter;
//      ellipse(loc.x, loc.y, diam, diam);
//      paths[i].update();
//    }
//  }
  
//  //saveFrame("t###.gif");
//  //if (frameCount==numFrames)
//  //  exit();
//}

//}
//public class PathFinder extends tree {

//  // 属性包括：位置、速度、直径
//  PVector location;
//  PVector velocity;
//  float diameter;
  
//  // 构造方法一：主干
//  PathFinder() {
//    location = new PVector(width/2, height);
//    velocity = new PVector(0, -2);
//    diameter = 40;
//  }
  
//  // 构造方法二：分枝
//  PathFinder(PathFinder parent) {
//    location = parent.location.get();
//    velocity = parent.velocity.get();
//    float area = PI*sq(parent.diameter/2);
//    float newDiam = sqrt(area/2/PI)*2;
//    diameter = newDiam;
//    parent.diameter = newDiam;
//  }

//  void update() {
//    if (diameter>0.5) {
//      location.add(velocity);
//      PVector bump = new PVector(random(-1, 1), random(-1, 1));  // 随机生长方向
//      bump.mult(0.1);
//      velocity.add(bump);
//      velocity.normalize();
      
//      // 分枝的概率为 0.025
//      if (random(0, 1)<0.025) {
//        paths = (PathFinder[]) append(paths, new PathFinder(this));
//      }
//    }
//  }
//}
