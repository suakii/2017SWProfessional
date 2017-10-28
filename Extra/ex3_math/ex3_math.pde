
String what = "sin";

void setup(){
  size(720,720);
}

void draw(){
  background(255);
  stroke(0);
  strokeWeight(1);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  stroke(233,84,32);
  float mx = mouseX - (width/2);
  float my = height - mouseY - (height/2);
  float[] lastPoint = new float[2];
  lastPoint[0] = -1*(width/2);
  lastPoint[1] = round(my*sin((mx/10)*0));
  for(int x = 0 - width/2; x < width/2; x++){
    double newY = 0;
    if(what=="sin")
      newY = my*sin(radians((mx/10)*x));
    if(what=="cos")
      newY = my*cos(radians((mx/10)*x));
      
    line(lastPoint[0]+width/2,lastPoint[1]+height/2,x+width/2,(float)newY+height/2);
    lastPoint[0] = x;
    lastPoint[1] = round((float)newY);
  }
  fill(0);
}

void mousePressed(){
  if(what=="sin"){
    what="cos";
  }
  else if(what=="cos"){
    what="sin";
  }
}