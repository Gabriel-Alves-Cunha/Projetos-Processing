float time = 0, fourierY;
ArrayList<Float> wave = new ArrayList();  

void setup() {
  size(600, 400);
  
  fourierY = dft(wave);
}

void draw() {
  background(0);
  translate(150, 200);
  float x = 0, y = 0;

  for (int i = 0; i < 2; i++) {
    float prevx = x, prevy = y;

    int n = i * 2 + 1;
    float radius = 75*(4/(n*PI));
    x += radius*cos(n*time);
    y += radius*sin(n*time);

    stroke(255, 100);
    noFill();
    ellipse(prevx, prevy, radius*2, radius*2);

    fill(255);
    stroke(255);
    line(prevx, prevy, x, y);
    ellipse(x, y, 8, 8);
  }
  wave.add(0, y);

  translate(200, 0);
  line(x-200, y, 0, wave.get(0));
  beginShape();
  noFill();
  for (int i = 0; i < wave.size(); i++) {
    point(i, wave.get(i));
  }
  endShape();

  time -= .05;

  if (wave.size() > 250) {
    wave.remove(250);
  }
}
