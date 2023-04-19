/*

//variables

int indexTab = 60;

int[] tabX = new int[indexTab];//on crée un tableau de 10 cases qui va contenir les abscisses de chaque cercles
int[] tabY = new int[indexTab];

int[] moveX = new int[indexTab];//on crée un tableau de 10 cases qui va contenir les valeurs de déplacement pour les cercles
int[] moveY = new int[indexTab];

int tmp = 0;//variable pouel compteur
int nbCercle = 1;//nb cercle sur le plateau

void setup() {
  size(1200, 800); //taille de l'écran

  for (int i = 0; i<indexTab; i++) {
    tabX[i] = (int)random(50, width-50);
    tabY[i] = (int)random(50, height-50);
    moveX[i] = (int)random(2, 5);
    moveY[i] = (int)random(2, 5);
  }
}

void draw() {
  background(0,80,100);
  if (tmp%60 == 0 && nbCercle<=30) {
    nbCercle++;
  }

  for (int i = 0; i<indexTab; i++) {
    tabX[i]+=moveX[i];
    tabY[i]+=moveY[i];
  }

  for (int i = 0; i<nbCercle; i++) {
    fill(230,80,15);
    ellipse(tabX[i], tabY[i], 50, 50);
  }

  fill(255);
  ellipse(mouseX, mouseY, 50, 50);


  for (int i = 0; i<indexTab; i++) {
    if (tabX[i]+25>1200 || tabX[i]-25<0)moveX[i]=-moveX[i];
    if (tabY[i]+25>800 || tabY[i]-25<0)moveY[i]=-moveY[i];
  }
  for (int i = 0; i<nbCercle; i++) {
    if (dist(mouseX, mouseY, tabX[i], tabY[i])<50)noLoop();
  }
  
  
  tmp++;
}

*/
/////////////////////////////////////////////////////
//variable

int xBalle;



void setup(){
  size(1200,800);
  xBalle = width / 2;
  
}


void draw(){
  noStroke();
  background(0,80,100);  
  
  fill(255);
  ellipse(mouseX, mouseY, 50,50);
  
  xBalle += 5;
  
  fill(230,80,30);
  ellipse(xBalle, height/2, 50,50);
  if(xBalle > width){
    xBalle = 0;
    
  }
}
