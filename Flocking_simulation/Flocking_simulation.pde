Boid[] flock = new Boid[10000]; //<>//

void setup() {
  size(640, 360);

  for (int i = 0; i < 10000; i++) {
    flock[i] = new Boid();
  }
}

void draw() {
  background(51);

  for (Boid boid : flock) {
    boid.edges();
    boid.update();
    boid.flock(flock);

    boid.show();
  }
}
