class Firework {
  Particula firework;
  boolean exploded = false;
  ArrayList<Particula> particulas = new ArrayList();
  int hue = (int)random(255);

  Firework() {
    this.firework = new Particula(random(-width/2, width/2), random(-width/2, width/2), height/2, true, hue);
  }

  void update() {
    if (!exploded) {
      this.firework.applyForce(gravity);
      this.firework.update();

      if (this.firework.vel.y >= 0) {
        exploded = true;
        this.explode();
      }
    }

    for (int i = this.particulas.size()-1; i >= 0; i--) {
      this.particulas.get(i).applyForce(gravity);
      this.particulas.get(i).update();
      if (this.particulas.get(i).done()) {
        this.particulas.remove(i);
      }
    }
  }

  void show() {

    if (!exploded) {
      this.firework.show();
    }
    for (int i = 0; i < this.particulas.size(); i++) {
      particulas.get(i).show();
    }
  }

  void explode() {
    for (int i = 0; i < 100; i++) {
      Particula p = new Particula(this.firework.pos.x, this.firework.pos.y, this.firework.pos.z, false, hue);
      this.particulas.add(p);
    }
  }

  boolean done2() {
    if (exploded && this.particulas.size() == 0) {
      return true;
    } else {
      return false;
    }
  }
}
