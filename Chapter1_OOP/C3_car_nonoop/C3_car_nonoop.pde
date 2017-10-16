
color c;
float xpos, ypos, xspeed;

void setup() {
  size(640,360);
  
  c = color(175);
  xpos = width/2;
  ypos = height/2;
  xspeed = 1;
  
  rectMode(CENTER);
  stroke(0);
  fill(c);
  
}

void draw() {
  background(255);
  
  rect(xpos, ypos, 20, 10);
  
  xpos = xpos + xspeed;
  
  if (xpos > width)
    xpos = 0;
  
}