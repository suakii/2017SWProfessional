int insidecount = 0;
int totalCount = 0;
float x, y;
void setup() {
  size(500,500);
  background(0);
}
void draw() {
    x = random(width);
    y = random(height);
    stroke(0);
    if (dist(0,height,x, y) <= width) {
      insidecount++;
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
  }
    ellipse(x, y, 4, 4); 
    totalCount++;
  noFill();
  stroke(255, 255, 255);
  arc(0, height, width * 2, height * 2,    TWO_PI-PI/2, TWO_PI);
    println(4.0*insidecount/totalCount);
}