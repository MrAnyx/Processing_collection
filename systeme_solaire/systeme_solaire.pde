float a1, a2;
float l1, l2;
float x1, x2;
float y1, y2;

void setup(){
  angleMode(DEGREES);
  size(1200,800);
  background(51);
  l1 = 100;
  l2 = 30;
  a2 = 0;
  noStroke();
  a1 = PI/2;

}

void draw(){
  // background(51);
  translate(width/2, height/2);

  x1 = l1*sin(a1);
  y1 = l1*cos(a1);

  x2 = x1 + l2*sin(a2);
  y2 = y1 + l2*cos(a2);

  fill(255,200,0); //sun
  ellipse(0,0,10,10);

  fill(0,150,255); //earth
  ellipse(x1,y1,20,20);

  fill(150,150,150); //moon
  ellipse(x2,y2,10,10);

  a1+=0.05;
  a2-=0.03;


}