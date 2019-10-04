class Ret {
  float vel;
  float x, y, w, mass;



  Ret(float x, float w, float v, float mass) {
    vel = v;
    this.x = x;
    this.w = w;
    this.y = height/2;
    this.mass = mass;
  }

  void display() {
    rect(x, y, w, -w);
    stroke(255);
  }

  void update() {
    x += vel;
  }

  boolean collide(Ret ret2) {
    return !(x + w < ret2.x || x > ret2.x + ret2.w);
  }

  float bounce(Ret ret2) {
    float sumM = mass + ret2.mass;
    float newVel = (mass - ret2.mass)/sumM * vel;
    newVel += (2*ret2.mass/sumM)*ret2.vel;
    return newVel;
  }

  void hitWall() {
    if (x <= 0) {
      vel *= -1;
      hit = true;
    } else {
      hit = false;
    }
  }


}
