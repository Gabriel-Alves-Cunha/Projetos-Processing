const c = 30;
const G = 3000;
const M = 65;
let m87;
const particulas = [];

function setup() {
  createCanvas(600, 600);
  ellipseMode(RADIUS);
  m87 = new Blackhole(width/2, height/2, G);

  let start = height/2;
  let end = height/2 - m87.rs*2.6;
  for(let y = end; y < start; y+=10){
    particulas.push(new Photon(width-20, y));
  }
}


function draw() {
  background(255);
  m87.show();
  
  for(let p of particulas){
    //p.update();
    p.show();
  }
}
