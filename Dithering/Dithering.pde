PImage kitten;

void setup() {
  size(1024, 512);
  kitten = loadImage("Kitten.jpg");
  kitten.filter(GRAY);
  image(kitten, 0, 0);
}

int index(int x, int y) {
  return x + y * kitten.width;
}

void draw() {
  kitten.loadPixels();
  for (int y = 0; y < kitten.height-1; y++) {
    for (int x = 1; x < kitten.width-1; x++) {
      color pix = kitten.pixels[index(x, y)];
      float oldR = red(pix), 
        oldG = green(pix), 
        oldB = blue(pix);
      int factor = 1, 
        newR = round(factor*oldR / 255)*(255/factor), 
        newG = round(factor*oldG / 255)*(255/factor), 
        newB = round(factor*oldB / 255)*(255/factor);
      kitten.pixels[index(x, y)] = color(newR, newG, newB);

      float errR = oldR - newR, 
        errG = oldG - newG, 
        errB = oldB - newB;

      int index1 = index(x+1, y);
      color c = kitten.pixels[index1];
      float r = red(c), 
        g = green(c), 
        b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      kitten.pixels[index1] = color(r, g, b);

      index1 = index(x-1, y+1);
      c = kitten.pixels[index1];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      kitten.pixels[index1] = color(r, g, b);

      index1 = index(x, y+1);
      c = kitten.pixels[index1];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      kitten.pixels[index1] = color(r, g, b);

      index1 = index(x+1, y+1);
      c = kitten.pixels[index1];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      kitten.pixels[index1] = color(r, g, b);
    }
  }
  kitten.updatePixels();
  image(kitten, 512, 0);
}
