class Drop {
  float x = random(width), y = random(-500, -50), z = random(0, 20), len = map(z, 0, 20, 10, 20), speed = map(z, 0, 20, 1, 20);

  void fall() {
    y += speed;
    float grav = map(z, 0, 20, 0, .2);
    speed += grav;

    if (y > height) {
      y = random(-200, -100);
      speed = map(z, 0, 20, 1, 20);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 1.5);
    strokeWeight(thick);
    stroke(138, 43, 226);
    line(x, y, x, y+len);
  }
}
