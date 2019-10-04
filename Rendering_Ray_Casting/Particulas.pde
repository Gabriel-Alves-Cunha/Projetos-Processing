class Particulas {
  PVector pos, vel;
  ArrayList<Ray> rays = new ArrayList();
  //Ray[] rays;
  float heading = 0;
  //PVector dir = PVector.fromAngle(radians(heading));
  int fov = 360;

  Particulas() {
    pos = new PVector(width/2, height/2);

    for (int i = -fov; i < fov; i+=1) {
      rays.add(new Ray(pos, radians(i)));
    }
  }

  ArrayList look(ArrayList<Boundary> paredes) {
    ArrayList<Float> history = new ArrayList();
    history.add(0, 1.0);
    for (Ray ray : rays) {
      PVector closest = null;
      float record = 999999;
      for (Boundary parede : paredes) {
        float[] a = ray.bateu(parede);
        PVector pt = new PVector(a[0], a[1]);

        if (a[0] > 0) {
          float d = PVector.dist(pos, pt);
          float an = ray.dir.heading() - heading;
          //d *= cos(an);
          if (d < record) {
            record = d;
            closest = pt; 
            history.add(record);
            // line(pos.x, pos.y, a[0], a[1]);}
          }
        }
      }
      if (closest != null) {
        stroke(255, 100);
        line(pos.x, pos.y, closest.x, closest.y);
      }
    }
    return history;
  }

  void show() {
    fill(255);
    ellipse(pos.x, pos.y, 4.0, 4.0);
    for (Ray ray : rays ) {
      ray.show();
    }
  }

  void update(float x, float y) {
    pos.set(x, y);
  }

  void rotate(float angle) {
    heading += angle;
    int index = 0;
    for (int i = -fov; i < fov; i++) {
      rays.get(index).dir = PVector.fromAngle(radians(i+heading));
      index++;
    }
  }
  
  void move(int i){
       vel = PVector.fromAngle(heading);
       vel.setMag(i);
       pos.add(vel);
  }
}
