class Ball {
  float mx, my;
  int s = 10;
  int dir = 0;
  boolean collision = false;
  int moveCount = 0;
  Ball(float imx, float imy) {
    mx = imx;
    my = imy;

  }

  void update() {
    for(int i = 0; i <nx*ny; i++){
      if(dist(pegs[i].x,pegs[i].y, mx, my) <= 10){
        dir = int(random(2));
        if(dir == 0) dir = -1;
        collision = true;  
      }
    }
    my++;
  }

  void move(){
    if (moveCount <= 20) {
      mx+= dir;
      moveCount++;
      my++;
    } else {
      collision = false;
      moveCount = 0;
    }
   
  }

  void display() {
    fill(200,100,0);
    stroke(200,100,0);
    ellipse(mx, my, s, s);
   
  }
}