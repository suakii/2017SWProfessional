class Cell {
  float x,y;   // x,y location
  float w,h;   // width and height
  int value;
  color cvalue;
  boolean current;
  boolean isShow;
  // Cell Constructor
  Cell(int i, int j) {
    x = j;//col
    y = i;//row
    value = 1;
    cvalue = color(255,255,255);
    current = false;
    isShow = false;
  } 
  
  
  void setValue(int value) {
    this.value = value; 
  }
  void setColor(color c) {
    this.cvalue = c;
  }

  void display() {
    if (isShow) {
      
      fill(255,255,255,100);
      rect(x*cellWidth,y*cellHeight,cellWidth-1,cellHeight-1); 
      
      fill(255,0,0);
      textAlign(LEFT, TOP);
      textSize(10);
      text(str(value), x*cellWidth, y*cellHeight, cellWidth-1,cellHeight-1);
    }
  }
}