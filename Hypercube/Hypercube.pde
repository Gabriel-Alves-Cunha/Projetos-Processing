float angle = 0;
P4Vector[] points = new P4Vector[16];

void setup() {
  size(640, 360, P3D);

  points[0] = new P4Vector(-1, -1, -1, 1);
  points[1] = new P4Vector(1, -1, -1, 1);
  points[2] = new P4Vector(1, 1, -1, 1);
  points[3] = new P4Vector(-1, 1, -1, 1);
  points[4] = new P4Vector(-1, -1, 1, 1);
  points[5] = new P4Vector(1, -1, 1, 1);
  points[6] = new P4Vector(1, 1, 1, 1);
  points[7] = new P4Vector(-1, 1, 1, 1);
  points[8] = new P4Vector(-1, -1, -1, -1);
  points[9] = new P4Vector(1, -1, -1, -1);
  points[10] = new P4Vector(1, 1, -1, -1);
  points[11] = new P4Vector(-1, 1, -1, -1);
  points[12] = new P4Vector(-1, -1, 1, -1);
  points[13] = new P4Vector(1, -1, 1, -1);
  points[14] = new P4Vector(1, 1, 1, -1);
  points[15] = new P4Vector(-1, 1, 1, -1);
  println(points.length);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  //rotateY(angle); 

  PVector[] pro3d = new PVector[16]; 

  for (int i = 0; i < points.length; i++) {
    P4Vector v = points[i];
    stroke(255);
    strokeWeight(16);
    noFill();

    float[][] rotationXY = {
      {cos(angle), -sin(angle), 0, 0}, 
      {sin(angle), cos(angle), 0, 0}, 
      {0, 0, 1, 0}, 
      {0, 0, 0, 1}
    };

    float[][] rotationXZ = {
      {cos(angle), 0, 0, -sin(angle)}, 
      {0, 1, 0, 0}, 
      {0, 0, 0, 1}, 
      {sin(angle), 0, 0, cos(angle)}
    };

    float[][] rotationXW = {
      {cos(angle), 0, 0, -sin(angle)}, 
      {0, 1, 0, 0}, 
      {0, 0, 1, 0}, 
      {sin(angle), 0, 0, cos(angle)}
    };

    float[][] rotationZW = {
      {1, 0, 0, 0}, 
      {0, 1, 0, 0}, 
      {0, 0, cos(angle), -sin(angle)}, 
      {0, 0, sin(angle), cos(angle)}
    };

    //P4Vector rotated = matmul(rotationXW, v, true);
    //rotated = matmul(rotationXY, rotated, true);

    float d = 2;
    //float w = (1/d-rotated.w);
    float w = (1/d-v.w);

    float[][] projection = {
      {w, 0, 0, 0}, 
      {0, w, 0, 0}, 
      {0, 0, w, 0}
    };

    PVector pro = matmul(projection, v);
    pro.mult(50);
    pro3d[i] = pro;

    point(pro.x, pro.y, pro.z);
  }

  for (int i = 0; i < 4; i++) {
    connect(0, i, (i+1)%4, pro3d);
    connect(0, i+4, ((i+1)%4)+4, pro3d);
    connect(0, i, i+4, pro3d);
  }
  for (int i = 0; i < 4; i++) {
    connect(8, i, (i+1)%4, pro3d);
    connect(8, i+4, ((i+1)%4)+4, pro3d);
    connect(8, i, i+4, pro3d);
  }
  for (int i = 0; i < 8; i++) {
    connect(0, i, i+8, pro3d);
  }

  angle += .03;
  println(frameRate);
}


void connect(int offset, int i, int j, PVector[] points) {
  PVector a = points[i+offset], b = points[j+offset];

  strokeWeight(1);
  stroke(255);
  line(a.x, a.y, a.z, b.x, b.y, b.z);
}
