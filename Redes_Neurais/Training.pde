class Point {
  float x, y, bias = 1;
  int label;

  Point() {
    x = random(-1, 1);
    y = random(-1, 1);

    float lineY = f(x);
    if (y > lineY) {
      label = 1;
    } else {
      label = -1;
    }
  }
  
   Point(float x_, float y_){
    this.x = x_;
    this.y = y_;
  }


  void show() {
    stroke(0);
    if ( label == 1) {
      fill(255);
    } else {
      fill(0);
    }
float px = pixelX(), py = pixelY();


    ellipse(px, py, 8, 8);
  }

  float pixelX() {
    return map(x, -1, 1, 0, width);
  }

  float pixelY() {
    return map(y, -1, 1, height, 0);
  }
  
  
}
