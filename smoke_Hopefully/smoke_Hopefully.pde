import java.util.*;

Sistema_de_Particulas sp;
Random generator;

float dx;
PVector wind;

void setup () {
  size(640, 360, P2D);
  
  generator = new Random();
  PImage img = loadImage("white.png");
  sp = new Sistema_de_Particulas(0, new PVector(width/2, height-75), img);
  //smooth();
}

void draw() {
  background(0);
 // blendMode(ADD);
  
  dx = map(mouseX, 0, width, -.2, .2);
  wind = new PVector(dx, 0);
  sp.applyForce(wind);
  sp.run();
  for(int i = 0; i < 2; i++){
    sp.addParticula();
    }
  
  print("\n"+frameRate);
 
}
