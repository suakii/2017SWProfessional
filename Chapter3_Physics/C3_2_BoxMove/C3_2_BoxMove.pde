Box box;
float s = PI / 4;
float mu = 0.5;

void setup() {
  size(600,600);
  box = new Box(width, 0);
  noLoop();
}

void draw() {
  background(255);
  
  stroke(0);
  strokeWeight(2);
  line(0,height,width,0);
  
  fill(0);
  //text("theta=45, normal=mgcos(theta)", width-200, height-20);
  //text("friction=0.5*normal",width-200, height-8);
    
  PVector g = new PVector(0,0.1);
  float Nsize = g.mag()*cos(s);
  PVector N = new PVector(-sin(s), -cos(s));
  N.mult(Nsize);
  float Fsize = mu*N.mag();
  PVector F = new PVector(cos(s),-sin(s));
  F.mult(Fsize);
  
  box.applyForce(g);
  box.applyForce(N);
  box.applyForce(F);
  
  box.update();
  box.display(s);
  if (box.position.x < 0) {
    box.position.x = width;
    box.position.y = 0;
  }
}

void mousePressed() {
  loop();
}