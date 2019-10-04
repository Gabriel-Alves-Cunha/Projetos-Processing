class Spot {
  int  f, g, h, x, y, w = width/cols, he = height/row;

  Spot(int i, int j) {
    x = i;
    y = j;
    f = 0;
    g = 0;
    h = 0;
  }

  void show(int cor) {
    fill(255);
    noStroke();
    rect(x*w, y*he, w-1, he-1);
  }
}
