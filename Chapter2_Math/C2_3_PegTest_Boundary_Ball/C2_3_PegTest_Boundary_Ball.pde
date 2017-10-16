
int numPegs = 100;
int nx = 20;
int ny = 20;
Ball[] balls = new Ball[0];

Peg[] pegs;
Boundary[] bounds = new Boundary[nx];

int[] container = new int[21];
int maxVal = 0;

void setup(){
  size(800, 800);
  smooth();
  
  fill(0);
  ellipseMode(CENTER);

  pegs = new Peg[nx*ny];

  int y, x;
  for(y = 0; y < ny; y++){
    for(x = 0; x < nx; x++){
      pegs[x + nx*y]= new Peg(width/(nx)*(x + float((y%2))/2),((height)/(ny+1)) * float(y));                 
     
     if (y == ny - 1) {
          bounds[x] = new Boundary(
                      (width/(nx)) * (x + float((y%2))/2),
                      ((height)/(ny+1)) * float(y)-22,
                      5,
                      50);                 
        }                     
    }
  }
 }

int count =0 ;
 
void draw(){
  background(255);
  count++;
  
    Ball b = new Ball(width/2,0);
    balls = (Ball[]) append(balls, b );
    
    
  for (int i = 0; i < nx*ny; i++) {
    pegs[i].display();
  }
  
  for (int i = 0; i < nx; i++) {
    bounds[i].display();
    
  }
   for (int i = 0; i < balls.length; i++) {
    if(!balls[i].collision)
      balls[i].update();
    else
      balls[i].move();
    
    balls[i].display();
    
    if(balls[i].my > height-30) 
      kill(i);
    
  }
  int w = width/container.length;
  
  fill(0, 0, 255);
  for(int i=0, j = 20; i < container.length; i++, j+=40){
    
    rect(j-10, height-container[i], 5, container[i]*50);
  }

}


void kill(int dead){
  //println(balls[dead].mx + " : "+((int)balls[dead].mx/40+1));
  if (int(balls[dead].mx) < 20)
    container[0]++;
  else
    container[(int(balls[dead].mx)+20)/40]++;
  
  for (int i = 0; i < balls.length-1; i++) {
    balls[i] = balls[i+1];
  }
  
  balls = (Ball[])shorten(balls);
}