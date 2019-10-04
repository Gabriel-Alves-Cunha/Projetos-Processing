let r, g, b;
let brain;
let witch = "black";

function pickColor() {
  r = random(255);
  g = random(255);
  b = random(255);
  redraw();
}

function setup() {
  createCanvas(640, 360);

  brain = new NeuralNetwork(3, 3, 2);
  pickColor();
  noLoop();

  for (let i = 0; i < 10000; i++) {
    let r = random(255);
    let g = random(255);
    let b = random(255);
    let targets = trainColor(r, g, b);
    let inputs = [r/255, g/255, b/255];
    brain.train(inputs, targets);
  }
}

function mousePressed() {
  let inputs = [(r/255), (g/255), (b/255)];
  let targets;
  if (mouseX > width/2) {
    targets = [0, 1];
  } else {
    targets = [1, 0];
  }
  brain.train(inputs, targets);

  pickColor();
}

function colorPredictor(r, g, b) {
  let inputs = [(r/255), (g/255), (b/255)];
  let outputs = brain.predict(inputs);
  console.log(outputs);

  if (outputs[0] > outputs[1]) {
    return "black";
  } else {
    return "white";
  }


  //if(r + g + b > 300){
  //  return "black";
  //} else {
  //  return "white";
  //}
}

function trainColor(r, g, b) {
  if (r + g + b > 300) {
    return [1, 0];
  } else {
    return [0, 1];
  }
}

function draw() {
  background(r, g, b);
  strokeWeight(4);
  stroke(0);
  line(width/2, 0, width/2, height);

  textSize(64);
  noStroke();
  fill(0);
  textAlign(CENTER, CENTER);
  text("black", 160, 100);
  fill(255);
  text("white", 480, 100);

  let witch = colorPredictor(r, g, b);
  if (witch === "black") {
    fill(0);
    ellipse(160, 200, 60);
  } else {
    fill(255);
    ellipse(480, 200, 60);
  }
}
