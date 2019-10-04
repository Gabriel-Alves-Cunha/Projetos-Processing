PImage fog;
float x = 200, y = 200, u;

void setup() {
  size(600, 400, P2D);
  fog = loadImage("white.png");
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(2);
  noFill();
  textureMode(NORMAL);
  beginShape(TRIANGLE_STRIP);
  texture(fog);
  for (float x = 10; x < 500; x+=50) {
    u = map(x, 100, 500, 0, 1);
    vertex(x, 200, u, 0);
    vertex(x, 250, u, 1);
  }

  endShape();
}
