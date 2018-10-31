//x+radius>x&&x-radius<x+width&&y+radius>y&&y-radius<y+height
Car car1=new Car(750,650,5,2);
Car car2=new Car(0,475,5,3);
Car car3=new Car(750,300,5,4);
Car car4=new Car(0,125,5,5);
int hopdistance=26;
int x=400;
int y=740;

int ballradius=13;
void setup(){
  size(850,800);

}
void draw(){
 background(255,49,0);

  car4.display1();
 car3.display2();
 car2.display3();
 car1.display4();
   fill(15, 44, 255); 
ellipse(x, y, ballradius*2,ballradius*2);
keepfrog();
if(y<=20){
  winner();
}



} 

void winner(){
   background(48,89,255);
   fill(2, 65, 156);
  String s = "YOU WON!!!!! Great job! You are now a frogger master!";
  fill(50);
  text(s, 20, 200);
  textSize(30);
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
 
   void display4() 
{
      fill(0,255,0);
      rect(x , y, 100, 37);
      x-=15;
      if(x<=0){
 x=750; 

}
}
void display3(){
  fill(0,255,0);
      rect(x , y, 100, 37);
     x+=17;
      if(x>=700){
 x=0; 
 }
}
 void caryvalue(){
   
 }
   
    void display2() 
{
      fill(0,255,0);
      rect(x , y, 100, 37);
      x-=14;
      if(x<=0){
 x=750; 

}
}

 void display1(){
  fill(0,255,0);
      rect(x , y, 100, 37);
     x+=18;
      if(x>=700){
 x=0; 
 }
}





}
  
  
  
  
  
  
  
  
  
  
  