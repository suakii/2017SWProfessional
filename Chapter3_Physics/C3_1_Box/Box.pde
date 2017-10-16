class Box {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;  
  Box(float x, float y) {
    mass = 1;
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display(float s) {
    pushMatrix();
    translate(position.x,position.y);
    stroke(0);
    rotate(-s);
    rect(0,0,15,-10);
    popMatrix();
  }
  
  
}