class Particula {
  PVector location, velocity, acceleration;
  float lifespan;
  PImage img;

  Particula(PVector l, PImage imagem) {
    float vx = (float) generator.nextGaussian()*.3, 
      vy = (float) generator.nextGaussian()*.3 - 1.0;

    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0);
    location = l.get();
    lifespan = 100.0;
    img = imagem;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void run() {
    update();
    render();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.5;
  }

  void render() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, location.x, location.y, 32, 32);
    // stroke(0, lifespan);
    // strokeWeight(.5);
    // fill(127, lifespan);
    // ellipse(location.x, location.y, 12, 12);
  }

  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
