class Mover {

  PVector acceleration, velocity, position;

  Mover(float mass, float x, float y) {
    position = new PVector(x, y); // Ñ-vetor posição  
    velocity = new PVector(0, 0); // Velocidade da entidade que tem posição acima
    acceleration = new PVector(0, 0); // Aceleração que vai ser aplicada ao vetor acima
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); // Fazendo uma cópia da força para não interferir no objeto força
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127, 100);
    ellipse(position.x, position.y, mass*20, mass*20);
  }

  void edges() {   // Colisões com as paredes do Canvas (janela)
    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }
  }
}
