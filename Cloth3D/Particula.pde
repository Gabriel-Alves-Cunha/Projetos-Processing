class Particula extends VerletParticle {

  Particula(float x, float y, float z){
    super(x, y, z);
  }
  
  void display(){
    pushMatrix();
    translate(x, y, z);
    fill(255);
    ellipse(x, y, 1, 1);
    popMatrix();
  }
}
