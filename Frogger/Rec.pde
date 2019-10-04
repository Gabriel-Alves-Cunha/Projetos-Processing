class Rec {
  float x, y, w, h;

  Rec(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  boolean intersects(Rec other) {
    float left = x, 
      right = x + w, 
      top = y, 
      bottom = y + h, 

      oleft = other.x, 
      oright = other.x + other. w, 
      otop = other.y, 
      obottom = other.y + other.h;

    return !(left >= oright || 
      right <= oleft ||
      top >= obottom ||
      bottom <= otop);
  }
}
