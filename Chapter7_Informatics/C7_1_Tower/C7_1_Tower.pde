
import java.util.Stack;


int numTower = 3;
Tower[] towers = new Tower[numTower];


float towerheight = 100;
float towerWidth = 10;
float towerspacing = 150;

int i;

void setup() {
  size(800, 400);
  
  for (int i = 0; i < towers.length; i++) {
    towers[i] = new Tower(width/4 + i*towerspacing, height/2,towerWidth,towerheight, str(char('A'+i)));
  }

}
void draw() {
  background(255);
  for (int i = 0; i < towers.length; i++) {
    towers[i].display();
    //println(towers[i].name);
  }

}