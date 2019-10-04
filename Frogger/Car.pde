class Car extends Rec {
  float speed;

  Car(float x, float y, float w, float h, float speed) {
    super(x, y, w, h);
    this.speed = speed;
  }

  void show() {
    fill(200);
    rect(x, y, w, h);
  }

  void update() {
    x += speed;
    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (x < -grid) {
      x = width + grid;
    }
  }
}
