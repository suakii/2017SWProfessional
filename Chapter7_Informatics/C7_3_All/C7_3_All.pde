
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
  
  /*
  disk3 = new Disk(40);
  towers[0].disks.push(disk3);
  disk3.x = width/4 - towerspacing*0 - disk3.w/2;
  disk3.y = height/2 + towerheight - disk3.h*4;
  
  disk4 = new Disk(30);
  towers[0].disks.push(disk4);
  disk4.x = width/4 - towerspacing*0 - disk4.w/2;
  disk4.y = height/2 + towerheight - disk4.h*5;
  */
  
  
  hanoi(3, towers[0], towers[2], towers[1]);//disks, from, to, temp)
    noLoop();

}

ArrayList<Move> moves = new ArrayList<Move>();


void draw() {
  background(255);
  for (int i = 0; i < towers.length; i++) {
    towers[i].display();
    //println(towers[i].name);
  }
  for (int j = 0; j < moves.size(); j++) {
    //println(moves.get(j).n +":" + moves.get(j).from.name + ":" + moves.get(j).to.name);
    
  }
  disk1.display();
  disk2.display();
  //disk3.display();
  //disk4.display();
  disk5.display();
    if (disk1.moving == 0 && disk2.moving ==0 && disk5.moving ==0  && i<moves.size()){
      move(moves.get(i).from,moves.get(i).to);
      i++;
    }
    
    //if (i == moves.size()) {
    //  fill(0, 0, 0);
    //  textSize(50);
    //  text("2^3 -1 = 7",50,50);
    //  noLoop();
      
    //}

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



void hanoi(int n, Tower from, Tower to, Tower temp) {
  if (n >=1) {
    hanoi(n-1, from, temp, to);
    moves.add(new Move(n,from, to));
    hanoi(n-1, temp, to, from);
  
  }
} 