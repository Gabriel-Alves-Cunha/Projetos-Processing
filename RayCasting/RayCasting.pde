// 2D Visibility
// Ray Casting
// The Coding Train
// Java Processing version by Gabriel Alves Cunha


ArrayList<Boundary> paredes = new ArrayList();
Ray ray;
Particulas particula;
float xoff, yoff = 10000;

void setup(){
  size(800, 600);
  
  for(int i = 0; i < 5; i++){
  paredes.add(new Boundary(random(width), random(height), random(width), random(height)));
  }
  particula = new Particulas();

// paredes nas paredes da janela:
paredes.add(new Boundary(0, 0, width, 0));
paredes.add(new Boundary(width, 0, width, height));
paredes.add(new Boundary(width, height, 0, height));
paredes.add(new Boundary(0, height, 0, 0));
}

void draw(){
  background(0);
  //parede.show();
  for(Boundary parede : paredes){
    parede.show();
  }
  particula.update(noise(xoff)*width, noise(yoff)*height);
  particula.show();
  particula.look(paredes);
  
  xoff += 0.01;
  yoff += 0.01;
  //ray.show();
  //ray.lookAt(mouseX, mouseY);
 
 // float[] a = ray.bateu(parede);
 // if(a[0]>0){
 //   fill(255);
 //   ellipse(a[0], a[1], 8, 8);
}
