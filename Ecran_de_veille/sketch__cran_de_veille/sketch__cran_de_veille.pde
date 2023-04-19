float t;

int r,v,b;
int r1 = 3;
int v1 = 8;
int b1 = 10;

void setup(){
  size(500,500); 
}


void draw(){
  fill(0,10);
  rect(-1,-1, width+1, height+1);
  strokeWeight(2);
  translate(width/2, height/2);
  
  x(t);
  y(t);
  x2(t);
  y2(t);
  
  stroke(r,v,b);
  
  if(t%2==0)line(x(t), y(t), x2(t), y2(t));
  t++;
  
  r+=r1;
  v+=v1;
  b+=b1;
  
  if(r>255 || r<1)r1=-r1;
  if(v>255 || v<1)v1=-v1;
  if(b>255 || b<1)b1=-b1;
  
  
}

float x(float t){
  return sin(t/50)*150;  
}

float y(float t){
  return cos(t/25)*150;  
}

float x2(float t){
  return sin(t/30)*150;  
}

float y2(float t){
  return cos(t/60)*150;  
}