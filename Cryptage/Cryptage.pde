
String nbr_lettre_platforme = ""; //variable lors de la saisie (12 Gmail (mot ou nombre))
String[] liste_crypt = new String[2]; //liste contenant le monbre de lettre et la plateforme et la clé de cryptage [12,Gmail,(mot ou nombre)]
String cle = "";//clé sous forme de String

String passWord = ""; //mot de passe final pas crypté
String passWord_crypt = "";//mot de passe crypté

PrintWriter fichier;

char a = ':'; //variable utile pour l'affichage de l'heure
int erreur1 = 0;//test s'il y a une erreur lors de la 1ere saisie
int erreur2 = 0;//test s'il y a une erreur lors de la 2eme saisie
int next = 0;//variable servant a changer de champ de saisie




//fonctions création de mdp aléatoire
String[] password(int a){
  String[] mdp = new String[a];
  
  String lettre = "a,A,z,Z,e,E,r,R,t,T,y,Y,u,U,i,I,o,O,p,P,q,Q,s,S,d,D,f,F,g,G,h,H,j,J,k,K,l,L,m,M,w,W,x,X,c,C,v,V,b,B,n,N,1,2,3,4,5,6,7,8,9";
  String[] liste_lettre = split(lettre, ',');
  
  for(int i=0; i<a; i++){
    mdp[i] = liste_lettre[int(random(61))];
  }
  return mdp;  
}

//fonction qui récupère le nombre de lettre dans le mdp et la platforme
String[] nombre_de_lettre_platforme(String text){
  String[] liste_nombre_de_lettre_platforme = new String[2];
  liste_nombre_de_lettre_platforme = split(text, ' ');
  return liste_nombre_de_lettre_platforme;  
}

String date(int a){ //fonction qui modifie l'heure et la date si il n'y a qu'un seul chiffre
  String date = "";
  if(str(a).length() == 1)date = "0"+str(a);
  else date = str(a);
  return date;
}

String mdp_crypted(String mdp, String cle){ 
  String[] liste_mdp = split(mdp, ' ');
  char[] liste_char = new char[liste_mdp.length]; //liste contenant le mdp en char
  char[] liste_cle = new char[liste_mdp.length]; //liste contenant la clé en char
  char[] liste_final_char = new char[liste_mdp.length]; // liste contenant la cle autant de fois pour remplir une liste contenant un nombre de cases egale a la taille de mdp
  int[] liste_int_cle = new int[liste_mdp.length]; // liste contenant la cle en int
  int[] liste_crypt = new int[liste_mdp.length]; // liste contenant le mdp crypté en int (ascii)
  char[] liste_crypt_char = new char[liste_mdp.length]; // liste contenant le mdp crypté en char
  String[] liste_final_mdp_crypt = new String[liste_mdp.length]; //liste contenant le mdp crypté en String
  String mdp_crypt;
  int j = 0;
  int f;
  
  for(int k = 0; k<cle.length(); k++){
    liste_cle[k] = cle.charAt(k); // convertir la liste de la clé(string) en liste (char)
  }
  
  if((int(liste_cle[0])-48)%2 == 0)f=1; //pour complexifier le cryptage
  else f=-1;
  

  for(int l = 0; l<liste_mdp.length; l++){
    liste_final_char[l] = liste_cle[j];// liste contenant la cle autant de fois pour remplir une liste contenant un nombre de cases egale a la taille de mdp
    liste_int_cle[l] = int(liste_final_char[l]-48); //conversion en int
    
    liste_int_cle[l] = liste_int_cle[l]*f; // positif ou negatif
    f=-f;
    j++;
    if(j>cle.length()-1)j=0;
  }
  
  for(int i = 0; i<liste_mdp.length; i++){
    liste_char[i] = liste_mdp[i].charAt(0); // liste contenant le mdp en char
    
    liste_crypt[i] = int(liste_char[i])+liste_int_cle[i]; //cryptage
    
    //ensemble de condition pour eviter les symbole après le cryptage (avant ou après les lettres ou les chiffres)
    if(int(liste_char[i]) <= 57 && int(liste_char[i]) >= 48 && liste_crypt[i] < 48)liste_crypt[i]+=10;
    if(int(liste_char[i]) <= 57 && int(liste_char[i]) >= 48 && liste_crypt[i] > 57)liste_crypt[i]-=10;
    
    if(int(liste_char[i]) <= 90 && int(liste_char[i]) >= 65 && liste_crypt[i] < 65)liste_crypt[i]+=26;
    if(int(liste_char[i]) <= 90 && int(liste_char[i]) >= 65 && liste_crypt[i] > 90)liste_crypt[i]-=26;
    
    if(int(liste_char[i]) <= 122 && int(liste_char[i]) >= 97 && liste_crypt[i] < 97)liste_crypt[i]+=26;
    if(int(liste_char[i]) <= 122 && int(liste_char[i]) >= 97 && liste_crypt[i] > 122)liste_crypt[i]-=26;

    liste_crypt_char[i] = char(liste_crypt[i]); //retourne la liste crypté du mdp en char
    liste_final_mdp_crypt[i] = str(liste_crypt_char[i]);
  }
    
    mdp_crypt = join(liste_final_mdp_crypt, ' ');
    
    return mdp_crypt;
}
  
 
void setup() {
  surface.setTitle(" Crypted");
  size(300,400);
  smooth();
  fichier = createWriter("Crypted.txt");
}

void draw() {
  background(150);
  textAlign(CENTER);
  textSize(17);
  text("Nombre caractère / Plateforme", 0, 20, width, height);
  
  
  if(mousePressed && mouseButton == LEFT && mouseX<280 && mouseX>20 && mouseY<90 && mouseY > 60)next = 2;
  if(next == 2)fill(100);
  else fill(0);
  rect(20,60,260,30);
  fill(255);
  textAlign(CENTER);
  text(nbr_lettre_platforme, 0,64, width, height); //champ de saisie dans la fenetre, quand on va ecrire, il va l'ajouter dans cette variable
  
  
  
  if(mousePressed && mouseButton == LEFT && mouseX<280 && mouseX>75 && mouseY<145 && mouseY > 115)next = 1;
  fill(0);
  text("Clé :", 42, 135);
  if(next == 1)fill(100);
  else fill(0);
  rect(75,115,205,30);
  fill(255);
  textAlign(CENTER);
  text(cle, 25,119, width, height); //champ de saisie dans la fenetre, quand on va ecrire, il va l'ajouter dans cette variable
  
  liste_crypt = nombre_de_lettre_platforme(nbr_lettre_platforme); //transforme la variable précédente en liste contenant le nombre de lettre et la plateforme [12,Gmail]

  textAlign(0);
  
  if(mouseX<280 && mouseX>20 && mouseY<220 && mouseY >170){fill(100);} //condition pour changer la couleur du rectangle "Création du password"
  else{fill(20);}
  rect(20,170,260,50);
  
  fill(255);
  textSize(20);
  text("Créer un Password",60,202);
  

  if(mouseX<83 && mouseX>20 && mouseY<380 && mouseY >350){fill(100);} //condition pour changer la couleur du rectangle "EXIT"
  else{fill(20);}
  rect(20,350,63,30);
  fill(255);
  text("EXIT",31,373);
  
  fill(255);
  rect(20, 240, 260, 40);
  rect(20, 290, 260, 40);
  fill(0);
  textAlign(CENTER);
  textSize(17);
  text(passWord, 0, 249, width, height); //affiche le password dans le rectangle blanc du bas
  text(passWord_crypt, 0, 299, width, height); //affiche le password dans le rectangle blanc du bas
  
  if(second()%2==0){a=' ';}
  else{a=':';}
  
  fill(0);
  text(date(day()) + "/" + date(month()) + "/" + year() + " | " + date(hour())+a+date(minute()),200, 370); //affichage de la date

  if(int(nbr_lettre_platforme.length()) > 22 || int(liste_crypt[0]) > 15 || int(liste_crypt[0]) <= 0){
    fill(255);
    noStroke();
    rect(22, 243, 257, 37);
    stroke(1);
    fill(175,46,46);
    textAlign(CENTER);
    text("ERREUR", 0, 249, width, height);
    fill(0);
    passWord="";
    erreur1 = 1;
  }
  else erreur1 = 0;
  
  if(cle.length() <= 0 || cle.length() > int(liste_crypt[0])){ //verifier si la clé entrée est bien un nombre
    fill(255);
    noStroke();
    rect(22, 292, 257, 37);
    stroke(1);
    fill(175,46,46);
    textAlign(CENTER);
    text("ERREUR", 0, 299, width, height);
    fill(0);
    passWord_crypt="";
    erreur2 = 1;
  }
  else erreur2 = 0;
    
    
}

void mousePressed(){
  if(mousePressed && mouseButton == LEFT && mouseX<280 && mouseX>20 && mouseY<220 && mouseY >170 && erreur1 == 0 && erreur2 == 0){passWord = join(password(int(liste_crypt[0])), ' ');passWord_crypt = mdp_crypted(passWord, cle); fichier.println(liste_crypt[1] + " : " + passWord + " | (" + cle + ") | " + passWord_crypt);fichier.flush();}
  if(mousePressed && mouseButton == LEFT && mouseX<83 && mouseX>20 && mouseY<380 && mouseY >350){exit();} 
}

void keyPressed() {
///////////////////////////////////////////////////////////////////////////////////////////////////
    if (keyCode == BACKSPACE && next == 2) {
     if (nbr_lettre_platforme.length() > 0 ) {
       nbr_lettre_platforme = nbr_lettre_platforme.substring( 0 , nbr_lettre_platforme.length()- 1 );
     }
    }
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && next == 2) {
      if(int(nbr_lettre_platforme.length()) > 22)nbr_lettre_platforme += "";
      else nbr_lettre_platforme = nbr_lettre_platforme + key;
   }

///////////////////////////////////////////////////////////////////////////////////////////////////
   
   if (keyCode == BACKSPACE && next == 1) {
     if (cle.length() > 0 ) {
       cle = cle.substring( 0 , cle.length()- 1 );
     }
   } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && next == 1) {
     if(int(cle.length()) > int(liste_crypt[0]))cle += "";
      else cle = cle + key;
   }
   
   if (keyCode == ENTER && erreur1 == 0 && erreur2 == 0) {passWord = join(password(int(liste_crypt[0])), ' ');passWord_crypt = mdp_crypted(passWord, cle); fichier.println(liste_crypt[1] + " : " + passWord + " | (" + cle + ") | " + passWord_crypt);fichier.flush();}
   
}