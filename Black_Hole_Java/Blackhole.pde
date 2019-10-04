class Blackhole {
  PVector pos; 
  float rs, x, y, mass = 6.5;
  
  Blackhole(float xc, float yc, float G){
    x = xc;
    y = yc;
    pos = new PVector(x, y);
    rs = (float)((2*G*mass)/(c*c));
  }
  
  void pull(Photon photon){
    PVector force = PVector.sub(pos, photon.pos);
    float r = force.mag();
    float fg = mass*G/(r*r);
    force.setMag(fg);
    photon.vel.add(force);
    photon.vel.setMag((c));
  }
  
  void show(){
    fill(0); 
    noStroke();
    circle(pos.x, pos.y, (float)rs);
    
    noFill();
    stroke(100, 100);
    strokeWeight(64);
    circle(this.pos.x, this.pos.y, (float)this.rs*3+32);
    
    stroke(255, 150, 0);
    strokeWeight(32);
    circle(this.pos.x, this.pos.y, (float)this.rs*1.5+16);
  }
} 
