int width = 500;
int data_length = 10000;
float[] x_data = new float[data_length];
float[] y_data = new float[data_length];

void setup() {  
  size(500,500);
  background(255);
  textSize(60);
  make_data();
}

void draw() { 
    background(255);
    //lines
    stroke(30);
    line(0,width/2,width,width/2);
    line(width/2,0,width/2,width);
    //dots
    fill(30);
    ///
    
    float minx = min(x_data);
    float maxx = max(x_data);
    float miny = min(y_data);
    float maxy = max(y_data);
    float scaling_factor_x = 0, scaling_factor_y = 0;
    
    if (abs(maxx) >= abs(minx)) 
        scaling_factor_x = (width/2)*.95/(maxx);
    
    if (abs(maxx) < abs(minx)) 
        scaling_factor_x = (width/2)*.95/(abs(minx));
    
    if (abs(maxy) >= abs(miny)) 
        scaling_factor_y = (width/2)*.95/(maxy);
    
    if (abs(maxy) < abs(miny)) 
        scaling_factor_y = (width/2)*.95/(abs(miny));
    
    for (int i = 0; i < data_length; i = i + 1) {
        if (x_data[i] != 0 && y_data[i] != 0) {
            ellipse(width/2 + int(x_data[i]*scaling_factor_x),width/2 - int(y_data[i]*scaling_factor_y),2,2);
        }
    }
    
    float big_x;
    float big_y;
    if (abs(maxx) >= abs(minx))
        big_x = maxx;
    else 
        big_x = abs(minx);
    
    if (abs(maxy) >= abs(miny))
        big_y = maxy;
    else 
        big_y = miny;
    
    text(round(big_x*100)/100,width-20,width/2 +16);
    text(-round(big_x*100)/100,10,width/2 +16);
    text(round(big_y*100)/100,width/2 +2,20);
    text(-round(big_y*100)/100,width/2 +2,width-10);
    text("0",width/2 +2,width/2+16);
    
    ///
    fill(30);
    textSize(20);
    
}

void make_data() {
    int count = 0;
    float x, y;
    for (float i = -9; i < 9; i+=0.005) {
       if (count < data_length) {
         x_data[count] = i;
         x = i;
         y = 1*sin(x);
         
         y_data[count] = y;
       }
       count++;
    }
}