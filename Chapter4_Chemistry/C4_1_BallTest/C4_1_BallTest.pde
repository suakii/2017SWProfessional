float mols = 100;
int numballs = Math.round(mols);
int min,max;
double rand;
float startvolume = 600.0;
long px, py;

Ball[] suakii =  new Ball[numballs];

void setup() {
  size(924,768);
  smooth();
  background(255);
  
  placeBalls();
  
    
  noLoop();
  
}

void draw() {
  
  drawBalls();
    
  
}
boolean isClick = false;
void mouseClicked() {
  isClick = !isClick;
  if (isClick)
    loop();
  else
    noLoop();
}

void placeBalls() { 
  for (int i = 0; i < numballs; i++) {
     max = height-10;
     min = height-10 -400;
     rand = Math.random() * (max - min) + min;
     py = Math.round(rand);
     
     max = 275 + Math.round(startvolume);
     min = 275;
     rand = Math.random() * (max - min) + min;
     px = Math.round(rand);
     suakii[i] = new Ball(new PVector(px, py));
     
  }
}

void drawBalls() {  //draw balls within the area each frame
  int speed = 4;
  for (int i = 0; i < numballs; i++) {
    suakii[i].setrectXY(500, -500);
    PVector force = new PVector(speed*random(-1,1), speed*random(-1,1));
    suakii[i].applyForce(force);
    suakii[i].run();
    
  }
}