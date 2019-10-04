class Spring extends VerletSpring2D {

  Spring(Particula a, Particula b){
    super(a, b, w, .5);
  }
  
  void display(){
    stroke(255);
    strokeWeight(2);
    line(a.x, a.y, b.x, b.y);
  }
}
