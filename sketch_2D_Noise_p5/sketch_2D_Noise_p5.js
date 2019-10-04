var scl = 10, cols, rows, inc = 0.1, zoff = 0;
var particulas = [], flowflield;

function setup() {
  createCanvas(400, 400);
  cols = floor(width/scl);
  rows = floor(height/scl);
  flowflield = new Array(cols*rows);

  for (var i = 0; i < 500; i++) {
    particulas[i] = new Particle();
  }
  background(255);
}


function draw() {
  //background(255);
  var yoff = 0;
  for (var y = 0; y < rows; y++) {
    var xoff = 0;
    for (var x = 0; x < cols; x++) {
      var index = x+y*cols;
      var angle = noise(xoff, yoff, zoff)*TWO_PI*3;
      var v = p5.Vector.fromAngle(angle);
      v.setMag(1);
      flowflield[index] = v;
      xoff += inc;
     // stroke(127);
     // push();
     // translate(x*scl, y*scl);
     // rotate(v.heading());
     // line(0, 0, scl, 0);

      pop();
    }
    yoff += inc;

    zoff += 0.001;
  }

  for (var i = 0; i < particulas.length; i++) {
  
  particulas[i].follow(flowflield);  
  particulas[i].update();
  particulas[i].edges();
  particulas[i].show();
  

}


// var fra = print(frameRate());
}
