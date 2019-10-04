class Photon {
  Photon(x,y){
    this.pos = createVector(x,y);
    //this.vel = createVector(-c, 0);
  }
  
  update(){
    this.pos.add(this.vel);
    this.pos.mult(0);
  }
  
  show(){
    strokeWeight(4);
    stroke(255, 0, 0);
    print("hello");
    point(x, y);
    print("point");
  }
}
