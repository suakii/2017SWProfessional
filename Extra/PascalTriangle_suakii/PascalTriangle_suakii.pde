
int cols = 15;
int rows =15;
int cellWidth, cellHeight;

int n = 22;
Cell[][]  grid = new Cell[rows][cols];

void setup() {

  size(800, 800);
  cellWidth = width/cols;
  cellHeight = height/rows;

  for (int i = 0; i < rows; i++) 
    for (int j = 0; j < cols; j++) 
      grid[i][j] = new Cell(i, j);
  
  
 frameRate(2);
 background(255);
}
int iteration = 1;//diagonal

void draw() {

  
  background(255);
  for (int i = 0; i <= iteration; i++) {//row
    
    for (int j = 0; j <= iteration; j++) {//col
      if (i == 0 || j == 0) {
        grid[i][j].setValue(1);
        grid[i][j].isShow = true;
        grid[i][j].current = true;
      }
      else  {
        grid[i][j].setValue(grid[i][j-1].value + grid[i-1][j].value);
        grid[i][j].isShow = true;
        grid[i][j].current = true;
      }
    }
  }
   for (int i = 0; i < rows; i++) 
      for (int j = 0; j < cols; j++)  {
        grid[i][j].display();
      }

  iteration++;
  if (iteration > 14)
    noLoop();
}