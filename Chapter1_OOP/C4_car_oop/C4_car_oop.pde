
Car myCar; 
void setup() {
  size(640,360);
  myCar = new Car();
}
void draw() {
  background(255);
  myCar.move(); 
  myCar.display();
}

class Car { 
  color c; 
  float xpos;
  float ypos;
  float xspeed;

  Car() { 
    c = color(175);
    xpos = width/2;
    ypos = height/2;
    xspeed = 1;
  }

  void display() { 
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(xpos,ypos,20,10);
  }

  void move() { // Function.
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}