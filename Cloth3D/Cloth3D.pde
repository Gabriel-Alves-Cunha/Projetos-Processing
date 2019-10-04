import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;



int cols = 40, rows = 40;
Particula[][] particulas = new Particula[cols][rows];
ArrayList<Spring> springs = new ArrayList();
float x = -200, w = 10;
VerletPhysics physics;
Spring s, s1, s2;


void setup() {
  size(600, 600, P3D);

  physics = new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(0, 1, 0)));
  
  for (int i = 0; i < cols; i++) {
    float z = -200;
    for (int j = 0; j < rows; j++) {
      Particula p = new Particula(x, 0, z);
      particulas[i][j] = p;
      physics.addParticle(p);
      z += w;
    }
    x += w;
  }

  for (int i = 0; i < cols-1; i++) {
    for (int j = 0; j < rows-1; j++) {
      Particula a = particulas[i][j];
      Particula b1 = particulas[i+1][j];
      Particula b2 = particulas[i][j+1];
      Particula b3 = particulas[i+1][j+1];

      s = new Spring(a, b1);
      s1 = new Spring(a, b2);
      s2 = new Spring(a, b3);
      springs.add(s);
      springs.add(s1);
      springs.add(s2);
      physics.addSpring(s);
      physics.addSpring(s1);
      physics.addSpring(s2);
    }
  }

  particulas[0][0].lock();
  particulas[cols-1][0].lock();
//  particulas[0][rows-1].lock();
 // particulas[cols-1][rows-1].lock();
}

float a = 0;

void draw() {
  background(51);
  translate(width/2, height/2);
  rotateX(a);

  physics.update();

//  for (int i = 0; i < cols; i++) {
 //  for (int j = 0; j < rows; j++) {
  //   particulas[i][j].display();
 //   }
//  }

  for (Spring s : springs) {
    s.display();
  }

  print("\n"+frameRate);
  a += .01;
}
