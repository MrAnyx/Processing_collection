String nbr_lettre_platforme = ""; //variable lors de la saisie (12 Gmail)
String[] nbr_lettre = new String[2]; //liste contenant le monbre de lettre et la plateforme [12,Gmail]
String passWord = ""; //mot de passe final
PrintWriter fichier;
char a = ':'; //variable utile pour l'affichage de l'heure
int erreur = 0;

//fonctions création de mdp aléatoire
String[] password(int a){
  String[] mdp = new String[a];
  
  String lettre = "a,A,z,Z,e,E,r,R,t,T,y,Y,u,U,i,I,o,O,p,P,q,Q,s,S,d,D,f,F,g,G,h,H,j,J,k,K,l,L,m,M,w,W,x,X,c,C,v,V,b,B,n,N,1,2,3,4,5,6,7,8,9,&,à,ù,$,!";
  String[] liste_lettre = split(lettre, ',');
  
  for(int i=0; i<a; i++){
    mdp[i] = liste_lettre[int(random(66))];
  }
  return mdp;  
}

//fonction qui récupère le nombre de lettre dans le mdp et la platforme
String[] nombre_de_lettre_platforme(String text){
  String[] liste_nombre_de_lettre_platforme = new String[2];
  liste_nombre_de_lettre_platforme = split(text, ' ');
  return liste_nombre_de_lettre_platforme;  
}


void setup() {
  surface.setTitle(" PassWords");
  size(300,400);
  smooth();
  fichier = createWriter("PassWords.txt");
}

void draw() {
  background(150);
  textAlign(CENTER);
  textSize(17);
  text("Nombre caractère / Platforme", 0, 20, width, height);
  

  rect(20,60,260,30);
  fill(255);
  textAlign(CENTER);
  text(nbr_lettre_platforme, 0,64, width, height); //champ de saisie dans la fenetre, quand on va ecrire, il va l'ajouter dans cette variable
  
  nbr_lettre = nombre_de_lettre_platforme(nbr_lettre_platforme); //transforme la variable précédente en liste contenant le nombre de lettre et la plateforme [12,Gmail]

  textAlign(0);
  
  if(mouseX<280 && mouseX>20 && mouseY<170 && mouseY >120){fill(100);} //condition pour changer la couleur du rectangle "Création du password"
  else{fill(20);}
  rect(20,120,260,50);
  
  fill(255);
  textSize(20);
  text("Créer un Password",60,152);
  

  if(mouseX<83 && mouseX>20 && mouseY<380 && mouseY >350){fill(100);} //condition pour changer la couleur du rectangle "EXIT"
  else{fill(20);cursor(HAND);}
  rect(20,350,63,30);
  fill(255);
  text("EXIT",31,373);
  
  fill(255);
  rect(20, 215, 260, 50);
  fill(0);
  textAlign(CENTER);
  textSize(17);
  text(passWord, 0, 229, width, height); //affiche le password dans le rectangle blanc du bas
  
  if(second()%2==0){a=' ';}
  else{a=':';}
  
  fill(0);
  text(day() + "/" + month() + "/" + year() + " | " + hour()+a+minute(),200, 370); //affichage de la date
  
  if((int(nbr_lettre[0]) < 0) || (int(nbr_lettre[0]) > 15)){
      fill(175,46,46);
      textAlign(CENTER);
      text("ERREUR", 0, 229, width, height);
      textSize(17);
      fill(0,0,0);
      text("Nombre de caractère trop grand", 0, 295, width, height);
      passWord = "";
      erreur = 1;
    }
  else{erreur = 0;}
    
    
}

void mousePressed(){
  if(mousePressed && mouseButton == LEFT && mouseX<280 && mouseX>20 && mouseY<170 && mouseY >120 && erreur == 0){passWord = join(password(int(nbr_lettre[0])), ' '); fichier.println(nbr_lettre[1] + " : " + passWord); fichier.flush();}
  if(mousePressed && mouseButton == LEFT && mouseX<83 && mouseX>20 && mouseY<380 && mouseY >350){exit();} 
}

void keyPressed() {
   if (keyCode == BACKSPACE) {
     if (nbr_lettre_platforme.length() > 0 ) {
       nbr_lettre_platforme = nbr_lettre_platforme.substring( 0 , nbr_lettre_platforme.length()- 1 );
     }
   } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
     nbr_lettre_platforme = nbr_lettre_platforme + key;
   }
   
   if (keyCode == ENTER && erreur == 0) {passWord = join(password(int(nbr_lettre[0])), ' '); fichier.println(nbr_lettre[1] + " : " + passWord); fichier.flush();}
   
}