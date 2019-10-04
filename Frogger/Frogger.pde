float grid = 50;
Frog frog;
Car[] cars;

void reset(){
frog = new Frog(width/2-grid/2, height-grid, grid);
}

void setup() {
  size(500, 500);
  reset();

  int index = 0;
  cars = new Car[4];
  //Row 1
  for (int i = 0; i < 2; i++) {
    float x = i * 300;
    cars[index] = new Car(x, height-grid*2, grid*2, grid, 2);
    index++;
  }
  //Row 2
  for (int i = 0; i < 2; i++) {
    float x = i * 200;
    cars[index] = new Car(x, height-grid*3, grid, grid, 2.6);
    index++;
  }
}

void draw() {
  background(56);

  frog.update();
  frog.show();

  for (Car car : cars) {
    car.update();
    car.show();
    if (frog.intersects(car)){
      println("Game OVER!!!");
      reset();
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    frog.move(0, -1);
  } else if (keyCode == DOWN) {
    frog.move(0, 1);
  } else if (keyCode == RIGHT) {
    frog.move(1, 0);
  } else if (keyCode == LEFT) {
    frog.move(-1, 0);
  }
}
