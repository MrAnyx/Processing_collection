//Definition des differentes variables

int PosRed_X; //position en X du joueur rouge durant la partie
int PosRed_Y;
int PlusRouge_X; //Avancement du joueur rouge en X
int PlusRouge_Y;

int PosBlue_X;
int PosBlue_Y;
int PlusBleu_X;
int PlusBleu_Y;

int[] tab_rouge_X = new int[600]; //tableau retracant le passage du carre rouge en X
int[] tab_rouge_Y = new int[600];

int[] tab_bleu_X = new int[600]; //tableau retracant le passage du carre bleu en X
int[] tab_bleu_Y = new int[600];

int r; //variable utile pour l'enregistrement du chemin empreinté par les deux carres

void setup(){
  r = 0;
  background(255); 
  
  //creation du plateau
  for(int i = 0; i<width; i+=20){
    for(int j = 0; j<height; j+=20){
      fill(255,255,255);
      rect(i,j,20,20);
    }
  }
  //haut, bas, droite, gauche initial
  int random = round(random(0,3));
  if(random == 0){PlusRouge_X = 20; PlusBleu_X = 20;}
  if(random == 1){PlusRouge_X = 20; PlusBleu_Y = 20;}
  if(random == 2){PlusRouge_Y = 20; PlusBleu_X = 20;}
  if(random == 3){PlusRouge_Y = 20; PlusBleu_Y = 20;}
    
    
    
  //Titre de la fenetre
  surface.setTitle("SquareBlock");
  
  size(601,601);
  smooth();

  //initialisation des positions initiales des carrés rouge et bleu
  PosRed_X=round(random(0,30))*20;
  PosRed_Y=round(random(0,30))*20;
  
  PosBlue_X=round(random(0,30))*20;
  PosBlue_Y=round(random(0,30))*20;
}


void draw(){
    frameRate(10);
    
    bordure_rouges();
    bordure_bleu();
    
    fill(255,0,0);
    rect(PosRed_X, PosRed_Y, 20, 20);
    
    fill(0,0,255);
    rect(PosBlue_X, PosBlue_Y, 20, 20);
    
    colision();
    
    //avancement des carres rouge et bleu
    PosRed_X+=PlusRouge_X;
    PosRed_Y+=PlusRouge_Y;
    
    PosBlue_X+=PlusBleu_X;
    PosBlue_Y+=PlusBleu_Y;
    
    //on entre chaque valeurs prisent par les carrés rouge et bleu dans un tableau a 600 cases
    tab_rouge_X[r] = PosRed_X;
    tab_rouge_Y[r] = PosRed_Y;
    
    tab_bleu_X[r] = PosBlue_X;
    tab_bleu_Y[r] = PosBlue_Y;
    
    r++;
    
}


void keyPressed(){
  
  if(keyCode == LEFT){PlusRouge_X = -20; PlusRouge_Y = 0;}
  if(keyCode == RIGHT){PlusRouge_X = 20; PlusRouge_Y = 0;}
  if(keyCode == UP){PlusRouge_X = 0; PlusRouge_Y = -20;}
  if(keyCode == DOWN){PlusRouge_X = 0; PlusRouge_Y = 20;}
  
  if(key == 'z' || key == 'Z'){PlusBleu_X = 0; PlusBleu_Y = -20;}
  if(key == 'q' || key == 'Q'){PlusBleu_X = -20; PlusBleu_Y = 0;}
  if(key == 's' || key == 'S'){PlusBleu_X = 0; PlusBleu_Y = 20;}
  if(key == 'd' || key == 'D'){PlusBleu_X = 20; PlusBleu_Y = 0;}
}