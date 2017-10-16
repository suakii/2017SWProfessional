
int numPegs = 100;
int nx = 20;
int ny = 20;

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
void draw(){
  background(255);
  for (int i = 0; i < nx*ny; i++) {
    pegs[i].display();
  }
  
  for (int i = 0; i < nx; i++) {
    bounds[i].display();
    
  }
  

}