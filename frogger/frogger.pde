Car car1=new Car(620,200,5,2);
Car car2=new Car(620,400,5,3);
Car car3=new Car(620,600,5,4);
int hopdistance=15;
int x=60;
int y=60;
int ballradius=13;
void setup(){
  size(800,800);
  
}
void draw(){
 background(255,49,0);

  car1.display();
 car2.display();
 car3.display();
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
class Car {
  int x;
  int y;
  int size;
  int speed;
Car(int x, int y, int size, int speed){
this.x=x;
this.y=y;
this.size=size;
this.speed=speed;
}
 
   void display() 
{
      fill(0,255,0);
      rect(x , y, 100, 37);
      x-=7;
}
 
    
 





}
  
  
  
  
  
  
  
  
  
  
  