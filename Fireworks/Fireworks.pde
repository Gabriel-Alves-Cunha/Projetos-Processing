import peasy.*;

ArrayList<Firework> fireworks = new ArrayList();
PVector gravity;
PeasyCam cam;

void setup() {
  size(640, 360, P3D);
  stroke(255);
  strokeWeight(4);
  cam = new PeasyCam(this, 500);
  
  gravity = new PVector(0, .1, 0);
  background(0);
}

void draw() {
  colorMode(RGB);
  background(0,0,0, 255);

  if (random(1) < .1) {
    fireworks.add(new Firework());
  }

  for (int i = fireworks.size()-1; i >= 0; i--) {
    fireworks.get(i).update();
    fireworks.get(i).show();

    if (fireworks.get(i).done2()) {
      fireworks.remove(fireworks.get(i));
    }
  }
  println(frameRate);
  //println("fireworks size: "+fireworks.size());
  
}  
