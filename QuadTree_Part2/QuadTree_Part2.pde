Rec boundary;
Quadtree qt;
Point p;
Rec range;
ArrayList<Point> found;

void setup() {
  size(800, 800);

  boundary = new Rec(0, 0, width, height);

  qt = new Quadtree(boundary, 4);



  found = new ArrayList();

  for (int i = 0; i < 500; i++) {
    int x = (int)random(width), y = (int)random(height);
    p = new Point(x, y);
    qt.insert(p);
  }
}

void draw() {

  background(0);
  qt.show();

  stroke(0, 255, 0);
  rectMode(CENTER);
  range = new Rec(mouseX, mouseY, 50, 50);
  rect(range.x, range.y, range.w*2, range.h*2);
  qt.query(range, found);
  println(found.size());

  for (Point p : found) {
    strokeWeight(4);
    point(p.x, p.y);
  }
  found.clear();
}
