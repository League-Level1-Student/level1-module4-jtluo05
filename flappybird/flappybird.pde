int y=300;
int upperPipeHeight = (int) random(100, 400);

int x=75;
int lower=600;

int upper=600;
int birdVelocity=30;
int gravity= 4;
void setup(){
  size(750,750);
 

}
void draw(){
 
background(26, 134, 31);
fill(2, 65, 156);
stroke(176, 14, 26);
 
if(upper==0&&lower==0){
upper=750;
upperPipeHeight = (int) random(100, 400);
lower=750;

}
fill(4, 215, 30);
rect(upper, 1, 68, upperPipeHeight);
  y=y+gravity;
fill(12, 56, 216);
rect(lower, upperPipeHeight+150, 68,900);

lower-=5;
upper-=5;


  ellipse(x, y, 25, 25);

}
void  mousePressed(){
  y=y-70;  
  
}