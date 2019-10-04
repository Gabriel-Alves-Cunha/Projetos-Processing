int c = 30; //<>//
float G = 1000, dt = 0.1, start, end;
Blackhole m87;
//Photon[] particulas;
ArrayList<Photon> particulas = new ArrayList();

void setup() { 
  size(600, 600);
  ellipseMode(RADIUS);
  m87 = new Blackhole(width/2, height/2, G);

  start = height/2.0;
  end = (height/2 - m87.rs*2.6);
  for (float y = 0; y < start; y+=10) {
    particulas.add(new Photon(width-20.0, y));
  }
}

void draw() {
  background(255);
  m87.show();

  stroke(0);
  strokeWeight(1);
  line(0, start, width, start);
  line(0, end, width, end);

  for (Photon p : particulas) {
    m87.pull(p);
    p.show();
    p.update();
  }
}
