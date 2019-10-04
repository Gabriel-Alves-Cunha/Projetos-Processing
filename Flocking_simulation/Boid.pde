class Boid {
  PVector pos, vel, acc;
  float maxForce = 1, maxSpeed = 4;

  Boid() {
    this.pos = new PVector(random(width), random(height));
    this.vel = PVector.random2D();
    vel.setMag(random(.5, 4));
    this.acc = new PVector(0, 0);
  }

  void edges() {
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.y = height;
    }
  }

  void show() {
    strokeWeight(8);
    stroke(255);
    point(pos.x, pos.y);
  }

  void update() {
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed);
    this.acc.mult(0);
  }

  PVector align(Boid[] boids) {
    float perceptionRadius = 50, total = 0;
    PVector steering = new PVector();
    for (Boid outro : boids) {
      float d = dist(this.pos.x, this.pos.y, outro.pos.x, outro.pos.y);
      if (outro != this && d < perceptionRadius ) {
        steering.add(outro.vel);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.setMag(maxSpeed);  
      steering.sub(this.vel);
      steering.limit(maxForce);
    }
    return steering;
  }

  PVector cohesion(Boid[] boids) {
    float perceptionRadius = 50, total = 0;
    PVector steering = new PVector();
    for (Boid outro : boids) {
      float d = dist(this.pos.x, this.pos.y, outro.pos.x, outro.pos.y);
      if (outro != this && d < perceptionRadius ) {
        steering.add(outro.pos);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.sub(this.pos);
      steering.setMag(maxSpeed);  
      steering.sub(this.vel);
      steering.limit(maxForce);
    }
    return steering;
  }
  
    PVector separation(Boid[] boids) {
    float perceptionRadius = 50, total = 0;
    PVector steering = new PVector();
    for (Boid outro : boids) {
      float d = dist(this.pos.x, this.pos.y, outro.pos.x, outro.pos.y);
      if (outro != this && d < perceptionRadius ) {
        PVector diff = PVector.sub(this.pos, outro.pos);
        diff.div(d);  
        steering.add(diff);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.setMag(maxSpeed);  
      steering.sub(this.vel);
      steering.limit(maxForce);
    }
    return steering;
  }

  void flock(Boid[] boids) {
    PVector alignment = align(boids), 
      cohesion = this.cohesion(boids),
      separation = this.separation(boids);
    this.acc.add(separation);
    this.acc.add(alignment);
    this.acc.add(cohesion);
  }
}
