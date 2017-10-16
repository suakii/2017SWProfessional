class Peg {
  float x, y;
  int s = 10;

  Peg(float px, float py) {
    x = px;
    y = py;//+30;
  }

  void display() {
    fill(0);
    stroke(0);
    ellipse(x, y, s, s);
  }
}