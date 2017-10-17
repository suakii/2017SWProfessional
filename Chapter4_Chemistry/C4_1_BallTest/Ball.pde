
class Ball
{
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  //set bounds
  int rectx, recty;
  int rightb;// = 275 + rectx;
  int leftb;// = 275;
  int topb;// = height-10 +recty;
  int bottomb;// = height-10; 
  
  Ball( PVector l) {
    velocity = new PVector(0,0);
    position = l.copy();
    acceleration = new PVector(0,0);

  }
  
  void setrectXY(int rectx, int recty) {
    this.rectx = rectx;
    this.recty = recty;
    this.rightb = 275 + rectx;
    this.leftb = 275;
    this.topb = height - 10 + recty;
    this.bottomb = height - 10;
  }
  
  void run() {
    update();
    checkEdges();
    display();
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, 1);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    
    
  }
  void display() {
    stroke(0);
    fill(255,0,0);
    ellipse(position.x, position.y, 6, 6);
  }
  
  void checkEdges() {

     if (position.x > rightb) {
      position.x = rightb;
      velocity.x *= -1;
    } else if (position.x < leftb) {
      velocity.x *= -1;
      position.x = leftb;
    }

    if (position.y > bottomb) {
      velocity.y *= -1;
      position.y = bottomb;
    } else if (position.y < topb) {
      velocity.y *= -1;
      position.y = topb;
    }
 
  }
  
}