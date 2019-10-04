class Photon{
  PVector pos, vel;
  ArrayList<PVector> history = new ArrayList();
  
  Photon(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector(-c, 0);
  }
  
  void show(){
    strokeWeight(4);
    stroke(255, 0, 0);
    point(pos.x, pos.y);
    
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for(PVector v:history){
      vertex(v.x, v.y);
    }
    endShape();
    
  }
  
  void update(){
    history.add(pos.copy());
    PVector dv = vel.copy();
    dv.mult(dt);
    pos.add(dv);
    
    if (history.size() > 500){
      history.remove(0);
    }
  }
}
