class Ball {
  PVector location, velocity;
  int r = 8; // raio da elipse

  Ball() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(2.5, -2);
  }

  void move() {
    location.add(velocity);
  }

  void bounce() {
    if ((location.x > (width-r)) || (location.x < r)) {
      velocity.x *= -1;
    }
    if ((location.y > (height-r)) || (location.y < r)) {
      velocity.y *= -1;
    }
  }
  
  void display(){
   stroke(0);
   strokeWeight(2);
   fill(127);
   ellipse(location.x, location.y, r*2, r*2);
  }
}
