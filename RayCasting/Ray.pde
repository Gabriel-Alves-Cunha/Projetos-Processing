class Ray {
  PVector pos, dir, bateu;


  Ray(PVector posi, float angle) {
    pos = posi;
    dir = PVector.fromAngle(angle);

  }

  void lookAt(float x, float y) {
    dir.x = x - pos.x;
    dir.y = y - pos.y;
    dir.normalize();
  }

  void show() {
    stroke(255);
    push();
    translate(pos.x, pos.y);
    line(0, 0, dir.x*10, dir.y*10);
    pop();
  }

  
    float[] bateu(Boundary parede) {
      
    float[] a = new float[2];
    
    float x1 = parede.a.x, y1 = parede.a.y, x2 = parede.b.x, y2 = parede.b.y;
    float x3 = pos.x, y3 = pos.y, x4 = (pos.x + dir.x), y4 = (pos.y + dir.y);

    float den = ((x1-x2)*(y3-y4) - (y1-y2)*(x3-x4));
    if (den == 0) { 
      print("paralelo");
    }

    float t = ((x1-x3)*(y3-y4)-(y1-y3)*(x3-x4))/den;
    float u = -(((x1-x2)*(y1-y3))-((y1-y2)*(x1-x3)))/den;


    if (t > 0 && t < 1 && u > 0) {

      a[0] = (x1 + t*(x2-x1));
      a[1] = (y1 + t*(y2-y1));

    } else {
      a[0] = 0;
      a[1] = 0;
    }
    
return a;
  }
}
