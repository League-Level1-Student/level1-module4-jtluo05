int hopdistance=15;
int x=60;
int y=60;
int ballradius=13;
void setup(){
  size(800,800);
  
}
void draw(){
  background(15,255,49);
  fill(15, 44, 255);
ellipse(x, y, ballradius*2,ballradius*2);
keepfrog();
}
void keyPressed()
{
      if(key == CODED){
            if(keyCode == UP)
            {
           y-=hopdistance;
            }
            else if(keyCode == DOWN)
            {
                 y+=hopdistance; 
            }
            else if(keyCode == RIGHT)
            {
                 x+=hopdistance;
            }
            else if(keyCode == LEFT)
            {
                 x-=hopdistance;
            }
      }
}
void keepfrog(){
  if(width-ballradius<=x){
    x=width-ballradius;
  }
  else if(0+ballradius>=x){
    x=0+ballradius;
  }
  if(height-ballradius<=y){
    y=height-ballradius;
  }
  else if(0+ballradius>=y){
    y=0+ballradius;
  }
}