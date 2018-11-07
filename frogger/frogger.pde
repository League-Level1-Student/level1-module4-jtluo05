
Car car1=new Car(750, 650, 100, 18);
Car car2=new Car(0, 475, 100, 19);
Car car3=new Car(750, 300, 100, 18);
Car car4=new Car(0, 125, 100, 22);
int hopdistance=24;
int x=400;
int y=740;

int ballradius=13;
void setup() {
  size(850, 800);
}
void draw() {
  background(255, 49, 0);

  car4.display();
  car3.display();
  car2.display();
  car1.display();
  fill(15, 44, 255); 
  ellipse(x, y, ballradius*2, ballradius*2);
  keepfrog();
  if (y<=20) {
    winner();
  }
  if (intersects(car1)) {
    x=(int)width/2;
    y=height-ballradius;
  }
 else if (intersects(car2)) {
   
    x=(int)width/2;
    y=height-ballradius;
  }
else  if (intersects(car3)) {
     x=(int)width/2;
    y=height-ballradius;
  }
 else if (intersects(car4)) {
       x=(int)width/2;
    y=height-ballradius;
  }
} 
boolean intersects(Car carhere) {
  if ((x+ballradius>carhere.getX()&&
  x-ballradius<carhere.getX()+carhere.getSize()&&
  y+ballradius>carhere.getY()&&
  y-ballradius<carhere.getY()+37))
  {
    return true;
  } else 
  {
    return false;
  }
}
void winner() {
  background(48, 89, 255);
  fill(2, 65, 156);
  String s = "YOU WON!!!!! Great job! You are now a frogger master!";
  fill(50);
  text(s, 20, 200);
  textSize(30);
}
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      y-=hopdistance;
    } else if (keyCode == DOWN)
    {
      y+=hopdistance;
    } else if (keyCode == RIGHT)
    {
      x+=hopdistance;
    } else if (keyCode == LEFT)
    {
      x-=hopdistance;
    }
  }
}
void keepfrog() {
  if (width-ballradius<=x) {
    x=width-ballradius;
  } else if (0+ballradius>=x) {
    x=0+ballradius;
  }
  if (height-ballradius<=y) {
    y=height-ballradius;
  } else if (0+ballradius>=y) {
    y=0+ballradius;
  }
} 
class Car {
  int x;
  int y;
  int size;
  int speed;

  Car(int x, int y, int size, int speed) {
    this.x=x;
    this.y=y;
    this.size=size;
    this.speed=speed;
  }

  void display() 
  {
    fill(0, 255, 0);
    rect(x, y, size, 37);
    x-=speed;
    if (x<=0) {
      x=width;
    }
  }

int getX() {

  return x;
}
int getY() {

  return y;
}
int getSize() {

  return size;
}
}