Rec boundary;
Quadtree qt;
Point p;

void setup() {
  size(400, 400);

  boundary = new Rec(200, 200, 200, 200);
  qt = new Quadtree(boundary, 4);

  //for (int i = 0; i < 500; i++) {
  //  p = new Point((int)random(width), (int)random(height));
  //  qt.insert(p);
  //}

  
}

void draw() {
  if(mousePressed){
     p = new Point(mouseX, mouseY);
     qt.insert(p);
  }
  
  background(0);
  qt.show();
}
