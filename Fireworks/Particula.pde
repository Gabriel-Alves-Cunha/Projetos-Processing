class Particula {
  PVector pos, vel, acc;
  boolean firework;
  int lifespan = 255;
  int hue;

  Particula(float x, float y, float z, boolean firework, int hue) {
    this.hue = hue;
    this.firework = firework;
    this.pos = new PVector(x, y, z);
    if (firework) {
      this.vel = new PVector(0, random(-9, -6), 1);
    } else {
      this.vel = PVector.random3D();
      this.vel.mult(random(2, 10));
    }
    this.acc = new PVector(0, 0, 0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    if (!firework) {
      this.vel.mult(0.9);
      lifespan -= 4;
    }

    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    colorMode(HSB);
    if (!firework) {
      strokeWeight(2);
      stroke(hue, 255, 255, this.lifespan);
    } else {
      strokeWeight(4);
      stroke(hue, 255, 255);
    }
    point(pos.x, pos.y);
  }

  boolean done() {
    if (this.lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
