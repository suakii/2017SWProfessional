
class Boundary {

  float x, y;
  float w, h;
  
  Boundary(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  
  }
  
  void display() {
    fill(255, 0, 0);
    stroke(255);
    rect(x, y+50, w, h);
    //println("x: " + x + " y: " + y);
  }
}