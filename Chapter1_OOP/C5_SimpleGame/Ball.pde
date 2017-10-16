class Ball {
  float x;       // x location  
  float y;       // y location  
  float speed;   // speed of square 
  float w;       // size
  // Ball 생성자
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 5;
  }
  void display() {
    fill(175); 
    stroke(0); 
    ellipse(x,y,w,w); 
  }
  void update() {
    y = y + speed; 
    speed = speed + gravity;
    if (y > height) { 
      speed = speed * -0.95;  
    } 
  }
  void disappear() {
     x = width*width;
  }
}