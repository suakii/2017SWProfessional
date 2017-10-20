
import java.util.Stack;


int numTower = 3;
Tower[] towers = new Tower[numTower];


float towerheight = 100;
float towerWidth = 10;
float towerspacing = 150;

int i;
Disk disk1, disk2, disk3, disk4, disk5;

void setup() {
  size(800, 400);
  
  for (int i = 0; i < towers.length; i++) {
    towers[i] = new Tower(width/4 + i*towerspacing, height/2,towerWidth,towerheight, str(char('A'+i)));
  }
  
  disk5 = new Disk(100);
  towers[0].disks.push(disk5);
  disk5.x = width/4 - towerspacing*0 - disk5.w/2;
  disk5.y = height/2 + towerheight - disk5.h;
  
  disk1 = new Disk(80);
  towers[0].disks.push(disk1);
  disk1.x = width/4 - towerspacing*0 - disk1.w/2;
  disk1.y = height/2 + towerheight - disk1.h*2;
  
  disk2 = new Disk(60);
  towers[0].disks.push(disk2);
  disk2.x = width/4 - towerspacing*0 - disk2.w/2;
  disk2.y = height/2 + towerheight - disk2.h*3;
  

  
    noLoop();

}


void draw() {
  background(255);
  for (int i = 0; i < towers.length; i++) {
    towers[i].display();
  }
  
  disk1.display();
  disk2.display();
  disk5.display();
 
}
boolean isClick = false;
void mouseClicked() {
  isClick = !isClick;
  if (isClick)
    loop();
  else
    noLoop();
}


void move(Tower from, Tower to) {
 Disk mover = (Disk)from.disks.pop();
  to.disks.push(mover);
  mover.moving = 1;
  mover.moveFrom = from;
  mover.moveTo = to;
  
}