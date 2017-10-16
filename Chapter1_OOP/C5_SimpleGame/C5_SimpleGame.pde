Ball[] balls;
Catcher catcher;
float gravity = 0.1;  

void setup() { 
  size(800,800); 
  smooth();
  
  catcher = new Catcher(100);
  balls = new Ball[50];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(width), random(height), random(50));
  }
} 

void draw() { 
  background(255); 
  catcher.setLocation(mouseX, mouseY);
  catcher.display();
  
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].update();
    if (catcher.intersect(balls[i])) {
      balls[i].disappear();
    }
  }
} 