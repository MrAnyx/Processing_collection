/* ------------ idée consigne pour le jeu ------------ */
/*                                                     */
/*     trouver l'image le plus rapidement possible     */
/*    en pressant la touche 'entrée', ça depixelise    */
/* --------------------------------------------------- */

PImage image;
float rect = 500;
float div = 1.2;

void setup() {
  size(1440, 960);
  image = loadImage("Avatar.jpg");
  surface.setTitle("Painting");
}
void draw() {
  frameRate(2);
  noStroke();

  rect/=div;


  for (int j = 0; j<960; j+=rect) {
    for (int i = 0; i<1440; i+=rect) {
      color c = image.get(int(i+(rect/2)), int(j+(rect/2)));
      fill(c);
      rect(i, j, rect, rect);
    }
  }
}