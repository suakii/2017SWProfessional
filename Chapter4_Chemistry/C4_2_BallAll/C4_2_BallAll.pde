float startvolume = 600.0;
float finalvolume = 20.0;
float mols = 100.0; 
float starttemperature = 20; 
float finaltemperature = 200; 
float R = 8.314;

int numballs = Math.round(mols);


//initialized variables
int[] coords = new int[4];
int min,max;
double rand;
long px, py;

int stepcounter = 0;
float volumestep, tempstep;
float pressure = 0,startPressure;
float temperature;
float volume, speed;

int rectx, recty;

Ball[] suakii =  new Ball[numballs];

void setup() {
  size(924,768);
  smooth();
  background(255);
  
  volumestep = (finalvolume - startvolume)/ 1000;
  tempstep = (starttemperature - finaltemperature)/ 1000;
  
  startPressure = (mols*starttemperature*R)/startvolume;
  
  placeBalls();
  
    
  noLoop();
  
}

void draw() {
  pressure = (mols*temperature*R)/volume;
  
  //add step to line graph
  if (stepcounter < 1000) {
    stepcounter++;
    volume = startvolume + volumestep*stepcounter;
    temperature = starttemperature - tempstep*stepcounter;
   
  }
  
  //calculate speed of particles
  speed = (temperature/100) + .05;
  
  //gas base rectangle
  stroke(0);
  fill(255,30);
  rectx = Math.round(volume);
  
  recty = -400;
  
  rect(275,height-10,rectx,recty);
  
  drawBalls();
  drawSideRect();
  barGraph();
    
  
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
  for (int i = 0; i < numballs; i++) {
    suakii[i].setrectXY(rectx, recty);
    PVector force = new PVector(speed*random(-1,1), speed*random(-1,1));
    suakii[i].applyForce(force);
    suakii[i].run();
    
  }
}
void drawSideRect() {
  noStroke();
  fill(255);
  rect(0,0,275,height);
  rect(0,0,width,height-10 +recty);
  rect(0,height-9,width,height);
  rect(276+rectx,0,width,height); 
}

void barGraph() {
  coords[0] = Math.round(pressure);
  coords[1] = Math.round(volume);
  coords[2] = Math.round(mols);
  coords[3] = Math.round(temperature);
  
  for (int x = 0; x < 4; x++) {
    stroke(0);
    rect (x*55+20, height-coords[x],50, coords[x]);
  }
  
  fill(0);
  text("P",40,height-5);  text("V",95,height-5);
  text("n",150,height-5);  text("T",205,height-5);
  text(coords[0],30,height-20);
  text(coords[1],95,height-coords[1]);
  text(coords[2],150,height-coords[2]);
  text(coords[3],205,height-coords[3]);
}