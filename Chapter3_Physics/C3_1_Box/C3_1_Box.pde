
Box box;
float s = PI / 4;

void setup() {
  size(600,600);
  box = new Box(width/2, height/2);
  //noLoop();
}

void draw() {
  background(255);
  
  stroke(0);
  strokeWeight(2);
  line(0,height,width,0);
  
  fill(0);
  println(box.position.x);
  
  box.display(s);
}