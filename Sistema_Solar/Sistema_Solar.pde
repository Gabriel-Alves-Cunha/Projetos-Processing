import peasy.*;

PeasyCam cam;
CorpoCeleste sol;
PImage sunTexture;
PImage[] textures = new PImage[3];

void setup(){
  size(640, 600, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[1] = loadImage("earth.jpg");
  textures[2] = loadImage("mercury.jpg");
  textures[0] = loadImage("mars.jpg");
  cam = new PeasyCam(this, 600);
  sol = new CorpoCeleste(50, 0, 0, sunTexture);
  sol.spawnMoons(5, 1);
}

void draw(){
  background(0);
  pointLight(255, 255, 255, 0, 0, 0);
  sol.show();
  sol.orbit();
  
  println(frameRate);
}
