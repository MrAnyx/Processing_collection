int posX, posY;
int dir;

color couleur = color(51);


void setup(){
	posX = 0;
	posY = 0;
	size(800,800);
	noStroke();

}


void draw(){
	translate(400,400);
	dir = floor(random(4));
	switch (dir) {
		case 0 : 
			posX+=10;
			break;
		case 1 : 
			posX-=10;
			break;
		case 2 : 
			posY+=10;
			break;
		case 3 : 
			posY-=10;
			break;
		
	}
	if(get(posX, posY) == color(255,255,255)){
		fill(0,0,0);
	}
	else{
		fill(255,255,255);
	}
	ellipse(posX, posY, 10,10);



}