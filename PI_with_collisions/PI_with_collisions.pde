Ret ret1, ret2;
int iter = 0, digitos = 2;
boolean hit = false;
int time = 10000000;


void setup() {
  size(600, 400);

  float m2 = pow(100, digitos-1);
  ret1 = new Ret(width/2, 50, -5, m2);
  ret2 = new Ret(width/3, 10, 0, 1);
}

void draw() {

  background(200);
  line(0, height/2, width, height/2);
  line(0, height/2, 0, 0);

  for (int i = 0; i < time; i++) {
    if (ret1.collide(ret2)) {
      float v1 = ret1.bounce(ret2);
      float v2 = ret2.bounce(ret1);
      ret1.vel = v1;
      ret2.vel = v2;
    }
    ret1.update();
    ret2.update();

    ret1.hitWall();
    ret2.hitWall();
    collision();
    ret1.display();
    ret2.display();
  }


  //ret1.display();
  //ret2.display();
}

void collision() {
  if (ret1.collide(ret2) || hit) {
    iter++;
    //print("clack "+iter+"\n");
    print("\nPI é igual a: "+iter+"\n");
  }
} 
