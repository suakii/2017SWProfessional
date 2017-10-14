
PVector position;
PVector velocity;

void setup() {
  size(800,200);
  smooth();
  position = new PVector(100,100);
  velocity = new PVector(2.5,2);
}

void draw() {
  background(255);
  
  // Add the current speed to the position.
  position.add(velocity);

  if ((position.x > width) || (position.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((position.y > height) || (position.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  // Display circle at x position
  stroke(0);
  strokeWeight(2);
  fill(127);
  ellipse(position.x,position.y,48,48);
}