class Particula extends VerletParticle2D {

  Particula(float x, float y){
    super(x, y);
  }
  
  void display(){
    fill(255);
    ellipse(x, y, 1, 1);
  }
}
