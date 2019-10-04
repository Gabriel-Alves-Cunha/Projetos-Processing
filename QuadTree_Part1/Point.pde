// I could do them with PVector

class Point {
  int x, y;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

class Rec {
  int x, y, w, h;

  Rec(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  boolean contains(Point point) {
    return (point.x > x - w && 
      point.x < x + w &&
      point.y > y - h &&
      point.y < y + h);
  }
}

class Quadtree {
  Rec boundary;
  int capacidade;
  ArrayList<Point> points = new ArrayList();
  boolean divided = false;
  Quadtree nordeste, noroeste, sudeste, sudoeste;




  Quadtree(Rec boundary, int capacidade) {
    this.boundary = boundary;
    this.capacidade = capacidade;
  }




  void subdivide() {
    int x = boundary.x, 
      y = boundary.y, 
      w = boundary.w, 
      h = boundary.h;

    Rec ne = new Rec(x + w/2, y - h/2, w/2, h/2);
    nordeste = new Quadtree(ne, capacidade);

    Rec nw = new Rec(x - w/2, y - h/2, w/2, h/2);
    noroeste = new Quadtree(nw, capacidade);

    Rec se = new Rec(x + w/2, y + h/2, w/2, h/2);
    sudeste = new Quadtree(se, capacidade);

    Rec sw = new Rec(x - w/2, y + h/2, w/2, h/2);
    sudoeste = new Quadtree(sw, capacidade);

    divided = true;
  }




  boolean insert(Point point) {
    if (!(boundary.contains(point))) {
      return false;
    }

    if (this.points.size() < this.capacidade) {
      points.add(point);
      
    } else {
      if (!divided) {
        subdivide();
      }

      nordeste.insert(point);
      noroeste.insert(point);
      sudeste.insert(point);
      sudoeste.insert(point);
      
    }
    return true;
  }




  void show() {
    stroke(255);
    strokeWeight(1);
    noFill();
    rectMode(CENTER);
    rect(boundary.x, boundary.y, boundary.w*2, boundary.h*2);

    if (divided) {
      nordeste.show();
      noroeste.show();
      sudeste.show();
      sudoeste.show();
    }

    for (Point p : points) {
      strokeWeight(4);
      point(p.x, p.y);
     }
  }
}
