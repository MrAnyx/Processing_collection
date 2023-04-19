int x_balle=0; //Position sur l'axe x de la balle orange
int score = 0; //Score du joueur
String condition="Haut"; //Endroit à rejoindre pour marquer un point

void setup() {
  size(750, 750); //Taille de la fenêtre
}

void draw() {
  background(0, 80, 100); // Couleur du fond
  
  noCursor();//optionel
  
  fill(255); //Couleur blanche
  textSize(20); //Taille du texte
  text(score, 25, 50); //Ecrire le score
  text(condition,25,325); //Ecrire l'endroit à rejoindre pour marquer un point
  
  fill(0); //couleur noir
  line(0, 100, 750, 100); // Ligne de zone de but haut
  line(0, 650, 750, 650); // Ligne de zone de but bas
  
  fill(255); //Blanc
  ellipse(mouseX, mouseY, 50, 50); //Rond de 50 de diametre, x=mouseX y=mouseY

  x_balle += 15; //Position de la balle

  //CONDITION DE SORTIE
  if (x_balle>800) 
  {
    x_balle=-50;
  }
  /////////////////////
  fill(230, 80, 15); //Couleur orange
  ellipse(x_balle, 375, 50, 50); //Balle a éviter
  
  //Condition pour marquer en haut/////////////
  if (condition.equals("Haut") && mouseY < 100) 
  {
      score++;
      condition = "Bas";
  }
  //Condition pour marquer en bas/////////////
  if (condition.equals("Bas") && mouseY > 650) 
  {
      score++;
      condition = "Haut"; 
  }

  //Condition de défaite///////////////////////
  if (dist(mouseX, mouseY, x_balle, 375)<50)
  {
    stop();
  }
  /////////////////////////////////////////////
}
