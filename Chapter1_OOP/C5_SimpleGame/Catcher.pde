class Catcher {
  float r;
  float x, y;
  
  Catcher(float tempR) {
    r = tempR;
    x = 0; 
    y = 0;
  }
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  
  void display() {
    stroke(0);
    fill(0);
    ellipse(x, y, r*2, r*2);
  }
  
  boolean intersect(Ball b) {
     float dist = dist(x, y, b.x, b.y);
     if (dist < r + b.w)
       return true;
     else
       return false;
  }

}