// I could do them with PVector

class Point extends Particula {
  float x, y;

  Point(float x, float y) {
    super(x, y);
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


  boolean intersects(Rec range) {
    return !(range.x - range.w > this.x + this.w ||
      range.x + range.w < this.x - this.w ||
      range.y - range.h > this.y + this.h ||
      range.y + range.h < this.y - this.h);
  }
}

class Circle {
  float x, y, r, rSquared;

  Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.rSquared = this.r * this.r;
  }

  boolean contains(Point point) {
    double d = (Math.pow((point.x - this.x), 2) + Math.pow((point.y - this.y), 2));
    return d <= this.rSquared;
  }

  boolean intersects(Rec range) {
    float xDist = Math.abs(range.x - this.x);
    float yDist = Math.abs(range.y - this.y);
    float r = this.r;
    float w = range.w;
    float h = range.h;
    double edges = Math.pow((xDist - w), 2) + Math.pow((yDist - h), 2);

    // no intersection 
    if (xDist > (r + w) || yDist > (r + h)) {
      return false;
    }

    // intersection within the circle
    if (xDist <= w || yDist > (r + h)) {
      return true;
    }

    // intersection on the edge of the circle 
    return edges <= this.rSquared;
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
    if (capacidade < 1) {
      println("capacidade deve ser maior que 1");
    }
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

    this.divided = true;
  }




  boolean insert(Point point) {
    if (!(this.boundary.contains(point))) {
      return false;
    }

    if (this.points.size() < this.capacidade) {
      this.points.add(point);
      return true;
    } 

    if (!this.divided) {
      subdivide();
    }

    return (this.nordeste.insert(point) ||
      this.noroeste.insert(point) ||
      this.sudeste.insert(point) ||
      this.sudoeste.insert(point));
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

    // for (Point p : points) {
    // strokeWeight(4);
    //point(p.x, p.y);
    //}
  }





  ArrayList query(Rec range, ArrayList found) {
    if (!(range.intersects(this.boundary))) {
      // will be empty array
      return found;
    }

    for (Point p : this.points) {
      if (range.contains(p)) {
        found.add(p);
      }
    }
   
    if (this.divided) {
      this.noroeste.query(range, found);
      this.nordeste.query(range, found);
      this.sudoeste.query(range, found);
      this.sudeste.query(range, found);
    }
    
    return found;
  }
  
  
}
