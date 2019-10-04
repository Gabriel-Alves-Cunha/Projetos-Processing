import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
//import toxi.physics.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;


int cols = 40, rows = 40;
Particula[][] particulas = new Particula[cols][rows];
ArrayList<Spring> springs = new ArrayList();
float x = 100, w = 10;
VerletPhysics2D physics;
Spring s, s1;


void setup() {
  size(600, 600);

  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 1)));
  
  for (int i = 0; i < cols; i++) {
    float y = 10;
    for (int j = 0; j < rows; j++) {
      Particula p = new Particula(x, y);
      particulas[i][j] = p;
      physics.addParticle(p);
      y += w;
    }
    x += w;
  }

  for (int i = 0; i < cols-1; i++) {
    for (int j = 0; j < rows-1; j++) {
      Particula a = particulas[i][j];
      Particula b1 = particulas[i+1][j];
      Particula b2 = particulas[i][j+1];

      s = new Spring(a, b1);
      s1 = new Spring(a, b2);
      springs.add(s);
      springs.add(s1);
      physics.addSpring(s);
      physics.addSpring(s1);
    }
  }

  particulas[0][0].lock();
  particulas[cols-1][0].lock();
}



void draw() {
  background(0);

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
}
