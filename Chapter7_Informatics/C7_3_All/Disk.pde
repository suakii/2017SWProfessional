
class Disk {

  float x=0;
  float y=0;
  float w;
  float h=15;
  int xspeed = 0;
  int yspeed = 0;
  int moving = 0;
  
  Tower moveFrom;
  Tower moveTo;
  int moveSpeed = 5;
  
  
  
  Disk(float w_) {
    w = w_;
  }

  void display() {
    stroke(255);
    fill(0,0,0);
    rect(this.x, this.y, this.w + towerWidth, this.h);
    this.x += this.xspeed;
    this.y += this.yspeed;

  if (this.moving == 1){
      if (this.moveFrom.x < this.moveTo.x){
        if (this.y > height/2 - 100 && this.x < this.moveTo.x - this.w/2 ){
          this.yspeed = -1*this.moveSpeed;
        }
        if (this.y == height/2 - 100 && this.x  < this.moveTo.x - this.w/2 ){
          this.yspeed = 0;
          this.xspeed = 1*this.moveSpeed;
        }
        if (this.y == height/2 - 100 && this.x == this.moveTo.x - this.w/2){
          this.xspeed = 0;
          this.yspeed = 1*this.moveSpeed;
        }
        if (this.y == height/2 + 100 - (this.moveTo.disks.size())*this.h  && this.x == this.moveTo.x - this.w/2){
          this.yspeed = 0;
          this.moving = 0;
        }
      
      }
      else{
        if (this.y > height/2 - 100 && this.x > this.moveTo.x - this.w/2 ){
          this.yspeed = -1*this.moveSpeed;
        }
        if (this.y == height/2 - 100 && this.x  > this.moveTo.x - this.w/2 ){
          this.yspeed = 0;
          this.xspeed = -1*this.moveSpeed;
        }
        if (this.y == height/2 - 100 && this.x == this.moveTo.x - this.w/2){
          this.xspeed = 0;
          this.yspeed = 1*this.moveSpeed;
        }
        if (this.y == height/2 + 100 - (this.moveTo.disks.size())*this.h && this.x == this.moveTo.x - this.w/2){
          this.yspeed = 0;
          this.moving = 0;
        }
      }
    }
  }//end of display
}