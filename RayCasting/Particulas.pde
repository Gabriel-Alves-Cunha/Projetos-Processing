class Particulas {
  PVector pos;
  ArrayList<Ray> rays = new ArrayList();

  Particulas() {
    pos = new PVector(width/2, height/2);

    for (int i = 0; i < 360; i+=1) {
      rays.add(new Ray(pos, radians(i)));
    }
  }

  void look(ArrayList<Boundary> paredes) {
    for (Ray ray : rays) {
      PVector closest = null;
      float record = 999999;
      for (Boundary parede : paredes) {
        float[] a = ray.bateu(parede);
        PVector pt = new PVector(a[0], a[1]);

        if (a[0] > 0) {
          float d = PVector.dist(pos, pt);
          if (d < record) {
            record = d;
            closest = pt;   
            // line(pos.x, pos.y, a[0], a[1]);}
          }
        }
      }
      if (closest != null){
        stroke(255, 100);
        line(pos.x, pos.y, closest.x, closest.y);
      }
    }
  }

  void show() {
    fill(255);
    ellipse(pos.x, pos.y, 1.0, 1.0);
    for (Ray ray : rays ) {
      ray.show();
    }
  }

  void update(float x, float y) {
    pos.set(x, y);
  }
}
