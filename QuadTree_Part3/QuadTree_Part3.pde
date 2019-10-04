Rec boundary; //<>//
Quadtree qt;
Point p;
Rec range;
ArrayList<Point> found, particulas;

void setup() {
  size(400, 400);



  particulas = new ArrayList();
  //found = new ArrayList();

  for (int i = 0; i < 2000; i++) {
    float x = random(width), y = random(height);
    p = new Point(x, y);
    particulas.add(p);
  }
}

void draw() {
  boundary = new Rec(width/2, height/2, width/2, height/2);
  qt = new Quadtree(boundary, 4);

  background(0);
  //qt.show();

  stroke(0, 255, 0);
  rectMode(CENTER);

  //range = new Rec(mouseX, mouseY, 50, 50);
  //rect(range.x, range.y, range.w*2, range.h*2);
  for (Point p : particulas) {
    qt.insert(p);
    p.move();
    p.render();
  }

  for (Point p : particulas) {
    //Circle range = new Circle(p.x, p.y, p.r*2);
    for (Point outra : particulas) {
      if (p != outra && p.intersects(outra)) {
        strokeWeight(4);
        //point(p.x, p.y);
        p.setHighlight(true);
        outra.setHighlight(true);
      }
    }
    p.setHighlight(false);
  }
  //println("found.size: "+found.size());
  //found.clear();
  println("FrameRate: "+frameRate);
}
