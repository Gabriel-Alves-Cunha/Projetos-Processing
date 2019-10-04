class CorpoCeleste {
  PVector v;
  float r, angle, d, orbitSpeed;
  CorpoCeleste[] planets;
  PShape globe;

  CorpoCeleste(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    this.r = r;
    angle = random(TWO_PI);
    this.d = d;
    orbitSpeed = o;
    v.mult(d);

    noStroke();
    noFill();
    globe = createShape(SPHERE, r);
    globe.setTexture(img);
  }

  void show() {
    pushMatrix();
    rotate(angle);
    noStroke();
    translate(v.x, v.y, v.z);
    fill(255);
    shape(globe);
    //sphere(r);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }

    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);

    popMatrix();
  }

  void spawnMoons(int total, int level) {
    planets = new CorpoCeleste[total];
    for (int i = 0; i < planets.length; i++) {
      float radius = r/(level*2), 
        d = random((radius+r), (radius+r)*2), 
        o = random(-.05, .05);
      int index = (int)random(0, 2);
      planets[i] = new CorpoCeleste(radius, d, o, textures[index]);
      if (level < 2) {
        int num = 1;//int(random(0, 4));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }

  void orbit() {
    angle += orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
}
