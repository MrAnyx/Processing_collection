//Variables

int start = int(random(0, 4));
////////////////////////////
int posX_cercle = 400;
int posY_cercle = 250;
int moveX_cercle = 4;
int moveY_cercle = 4;
////////////////////////////
int posY_rect = 50;
int moveY_rect = 8;
boolean moveYbool_rect = false;

int posY_rect2 = 50;
int moveY_rect2 = 8;


void setup() {
  size(800, 500);
  smooth();
  noStroke();
  surface.setTitle("Pong");
}



void draw() {
  collision();
  fill(0, 40);
  rect(0, 0, width, height);
  fill(255);
  ellipse(posX_cercle, posY_cercle, 20, 20);
  
  if(posY_cercle < 10){moveY_cercle = -moveY_cercle;}
  if(posY_cercle > 490){moveY_cercle = -moveY_cercle;}


  if (keyCode == UP && moveYbool_rect == true){posY_rect-=moveY_rect;}
  if (keyCode == DOWN && moveYbool_rect == true){posY_rect+=moveY_rect;}
  
  if (posY_rect<0){posY_rect+=moveY_rect;}
  if (posY_rect>420){posY_rect-=moveY_rect;}

  fill(255);
  rect(10, posY_rect, 15, 80);
  
  rect(775,posY_rect2,15,80);
  
  posY_cercle+=moveY_cercle;
  posX_cercle+=moveX_cercle;
  
  posY_rect2 = posY_cercle-40;
}


void keyPressed() {
  if (keyCode == UP || keyCode == DOWN) {
    moveYbool_rect = true;
  }
}

void keyReleased() {
  if (keyCode == UP || keyCode == DOWN) {
    moveYbool_rect = false;
  }
}

void collision(){
  if(posX_cercle <  35 && posX_cercle > 10 && posY_cercle < posY_rect+80 && posY_cercle > posY_rect){moveX_cercle = -moveX_cercle;}
  if(posX_cercle >  765 && posX_cercle < 790 && posY_cercle < posY_rect2+80 && posY_cercle > posY_rect2){moveX_cercle = -moveX_cercle;}
  
}