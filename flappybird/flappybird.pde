int y=300;
int upperPipeHeight = (int) random(100, 400);
int points=0;
int x=75;
int lower=600;
boolean endgame=false;
int upper=600;
int birdVelocity=30;
int gravity= 4;
void setup() {
  size(750, 750);
}
void draw() {
  if (endgame) {
    endGame();
  } else {
    background(26, 134, 31);
    fill(2, 65, 156);
    stroke(176, 14, 26);


    if (intersectsPipes()) {
      endgame=true;
    } else {  
      points++;
      String s =String.valueOf(points);
      fill(175);
      text(s, 30, 30, 150, 160);
      textSize(30);
      if (upper==0&&lower==0) {
        upper=750;
        upperPipeHeight = (int) random(100, 400);
        lower=750;
      }
    }
  
  fill(4, 215, 30);
  rect(upper, 1, 68, upperPipeHeight);
  y=y+gravity;
  fill(12, 56, 216);
  rect(lower, upperPipeHeight+150, 68, 900);

  lower-=5;
  upper-=5;
  }

  ellipse(x, y, 25, 25);
}
boolean intersectsPipes() { 
  if (y < upperPipeHeight && x > upper && x < (x+68)) {
    return true;
  } else if (y>upperPipeHeight+150 && x > upper && x < (upper+68)) {
    return true;
  } else { 
    return false;
  }
}
void  mousePressed() {
  y=y-70;
}
void endGame() {

  background(255, 9, 5);
  fill(2, 65, 156);
  String s = "End game. You lost. Your final score was "+ points;
  fill(50);
  text(s, 20, 100);
  textSize(30);
} 