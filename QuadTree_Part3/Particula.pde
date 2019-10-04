class Particula {
  float x, y, r;
  boolean highlight = false;

  Particula(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 3;
  }

  void move() {
    this.x += random(-2, 2);
    this.y += random(-2, 2);
  }

  void render() {
    noStroke();
    if (highlight) {
      fill(255);
    } else {
      fill(100);
    }
    ellipse(x, y, r*2, r*2);
  }

  void setHighlight(boolean val) {
    highlight = val;
  }

  boolean intersects(Particula outra) {
    float d = dist(x, y, outra.x, outra.y);
    return (d < r + outra.r);
  }
}
