PImage fond;
int x = 70;
int y = 10;
boolean up, down, right, left;
int move = 1;
color a,b,c,d;



void setup(){
  size(883,922);
  fond = loadImage("labyrinthe.bmp");
  
  
}


void draw(){

  if(up == true)y-=move;
  if(down == true)y+=move;
  if(right == true)x+=move;
  if(left == true)x-=move;
  
  noStroke();
  fill(#1CABEA);
  image(fond,0,0);
  
  
  rect(x,y,15,15);

  
  if(red(fond.get(x,y)) < 20 || green(fond.get(x,y)) < 20 || blue(fond.get(x,y)) < 20){move = 0;}
  if(red(fond.get(x,y+15)) < 20 || green(fond.get(x,y+15)) < 20 || blue(fond.get(x,y+15)) < 20){move = 0;}
  if(red(fond.get(x+15,y)) < 20 || green(fond.get(x+15,y)) < 20 || blue(fond.get(x+15,y)) < 20){move = 0;}
  if(red(fond.get(x+15,+15)) < 20 || green(fond.get(x+15,+15)) < 20 || blue(fond.get(x+15,+15)) < 20){move = 0;}

}


void keyPressed(){
  if(keyCode == UP)up=true;
  if(keyCode == DOWN)down = true;
  if(keyCode == RIGHT)right=true;
  if(keyCode == LEFT)left = true;
  if(key == 'r'){x = 70; y = 10;move = 1;}
}

void keyReleased(){
  if(keyCode == UP)up=false;
  if(keyCode == DOWN)down = false;
  if(keyCode == RIGHT)right=false;
  if(keyCode == LEFT)left = false;
}