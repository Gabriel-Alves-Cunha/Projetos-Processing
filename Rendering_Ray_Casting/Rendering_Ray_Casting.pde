// 2D Visibility //<>//
// Rendering Ray Casting
// The Coding Train
// Java Processing version by Gabriel Alves Cunha

import java.awt.event.KeyEvent;

ArrayList<Float> scene;// = new ArrayList();
ArrayList<Boundary> paredes = new ArrayList();
Ray ray;
Particulas particula;
float xoff, yoff = 10000;
int sceneW = 400, sceneH = 400;

void setup() {
  size(800, 400);

  for (int i = 0; i < 5; i++) {
    paredes.add(new Boundary(random(width-400), random(height), random(width-400), random(height)));
  }
  particula = new Particulas();

  // paredes nas paredes da janela:
  //paredes.add(new Boundary(0, 0, width, 0));
  //paredes.add(new Boundary(width, 0, width, height));
  //paredes.add(new Boundary(width, height, 0, height));
  //paredes.add(new Boundary(0, height, 0, 0));
}

void draw() {
  background(0);
  //parede.show();
  for (Boundary parede : paredes) {
    parede.show();
  }
  // particula.update(noise(xoff)*(width-400), noise(yoff)*height);
  //particula.update(mouseX, mouseY);
  particula.show();
  // xoff += 0.01;
  //yoff += 0.01;
  scene = particula.look(paredes);
  float w = sceneW/scene.size();

  push();
  translate(sceneW, 0);
  for (int i = 0; i < scene.size(); i++) {
    noStroke();
    float sq = scene.get(i)*scene.get(i);
    float wSq = sceneW*sceneW;
    float b = map(sq, 0, wSq, 255, 0);
    float h = map((float)(scene.get(i)), 0, sceneW, sceneH, 0);
    fill(b);
    rectMode(CENTER);
    rect(i*w+w/2, sceneH/2, w+1, h);
  }
  pop();

  keyPressed();

  //ray.show();
  //ray.lookAt(mouseX, mouseY);

  // float[] a = ray.bateu(parede);
  // if(a[0]>0){
  //   fill(255);
  //   ellipse(a[0], a[1], 8, 8);
}

void keyPressed() {

  if (key == 'a') {
    particula.rotate(-.1);
  } else if ( key == 'd') {
    particula.rotate(.1);
  } else { 
    particula.rotate(0);
  } 
  if (key == 'w') {
    particula.move(1);
  } else if (key == 's') {
    particula.move(-1);
  }
}
