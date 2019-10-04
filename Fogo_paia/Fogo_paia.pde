PGraphics buffer1, buffer2;
PImage cooling;
int w = 600, h = 400;
float ystart = 0;

void setup() {
  size(1200, 400);

  buffer1 = createGraphics(w, h);
  buffer2 = createGraphics(w, h);
  cooling = createImage(w, h, RGB);
}

void fire(int rows) {
  buffer1.beginDraw();
  buffer1.loadPixels();
  for (int x = 0; x < w; x++) {
    for (int j = 0; j < rows; j++) {
      int y = h - (j+1);
      int index = x + y * w;
      buffer1.pixels[index] = color(255);
    }
  }
  buffer1.updatePixels();
  buffer1.endDraw();
}

void draw() {  
  background(0);

  fire(5);
  cool();

  buffer2.beginDraw();
  buffer1.loadPixels();
  buffer2.loadPixels();
  for (int x = 0; x < w - 1; x++) {
    for (int y = 1; y < h - 1; y++) {
      int index0 = x + y * w, 
        index1 = (x+1) + y * w, 
        index2 = (x-1) + y * w, 
        index3 = x + (y+1) * w, 
        index4 = x + (y-1) * w;
      color c1 = buffer1.pixels[index1], 
        c2 = buffer1.pixels[index2], 
        c3 = buffer1.pixels[index3], 
        c4 = buffer1.pixels[index4], 

        c5 = cooling.pixels[index0];

      float newC = brightness(c1) + brightness(c2) + brightness(c3) + brightness(c4);
      newC -= brightness(c5);

      buffer2.pixels[index4] = color(newC * .25);
    }
  }
  buffer2.updatePixels();
  buffer2.endDraw();

  // Swap
  PGraphics tmp = buffer1;
  buffer1 = buffer2;
  buffer2 = tmp;

  image(buffer2, 0, 0);
  image(cooling, w, 0);
}

void cool() {
  cooling.loadPixels();

  float xoff = 0.0, increment = .02; // Start xoff at 0

  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < w; x+=1) {
    xoff += increment;   // Increment xoff 
    float yoff = ystart;   // For every xoff, start yoff at 0
    for (int y = 0; y < h; y+=1) {
      yoff += increment; // Increment yoff

      // Calculate noise and scale by 255
      float n = noise(xoff, yoff);
      float bright = n * 50;

      // Try using this line instead
      //float bright = random(0, 255);

      // Set each pixel onscreen to a grayscale value
      cooling.pixels[x+y*w] = color(bright);
    }
  }

  cooling.updatePixels();
  ystart += increment;
}

void mouseDragged(){
  buffer1.beginDraw();
  buffer1.fill(255);
  buffer1.noStroke();
  buffer1.ellipse(mouseX, mouseY, 100, 100);
  buffer1.endDraw();
}
