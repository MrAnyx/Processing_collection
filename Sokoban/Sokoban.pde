PImage background; //déclaration de la variable pour la background de type PImage
PImage level;


int[][] tab = new int[21][13];
Perso perso = new Perso();


void setup(){
    size(900,600);
    background = loadImage("background.jpg");
    level = loadImage("test.png");


}



void draw(){

    coordTab();
    image(background,0,0);
    image(level,0,0);

    perso.show();
}
