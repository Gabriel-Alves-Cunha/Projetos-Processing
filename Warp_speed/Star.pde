class Star {
  float x, y, z, dz;

  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    dz = z;
  }

  void update() {
    z -= speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
      dz = z;
    }
  }

  void show() {
    fill(250);
    noStroke();

    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);

    float r = map(z, 0, width, 3, 0);
    //ellipse(sx, sy, r, r);
    
    float dx = map(x/dz, 0, 1, 0, width);
    float dy = map(y/dz, 0, 1, 0, height);
    
    dz = z;
    stroke(250);
    line(dx, dy, sx, sy);
    

  }
}
