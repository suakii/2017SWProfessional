
class Tower {

  float x;
  float y;
  float w;
  float h;
  String name;
  Stack disks;
  
  Tower(float x_, float y_, float w_, float h_, String name_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    disks = new Stack();
    this.name = name_;
  }
  
  void display() {
    stroke(255);
    fill(0);
    rect(x, y, w, h);
  }

}