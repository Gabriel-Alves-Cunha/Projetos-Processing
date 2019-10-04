class Blackhole{
  constructor(x, y, G){
    this.pos = createVector(x, y);
    this.mass = 6.5;
    this.rs = 2*G*this.mass/(c*c);
  }
  
  show(){
    fill(0);
    noStroke();
    circle(this.pos.x, this.pos.y, this.rs*2);
    
    noFill();
    stroke(100, 100);
    strokeWeight(64);
    circle(this.pos.x, this.pos.y, this.rs*3+32);
    
    stroke(255, 150, 0);
    strokeWeight(32);
    circle(this.pos.x, this.pos.y, this.rs*1.5+16);
    }
}
