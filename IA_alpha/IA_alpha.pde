int[] posX_cercle = new int[5];
int[] posY_cercle = new int[5];

int[] ia_index = new int[5];

int tmpX_cercle = 0;
int tmpY_cercle = 0;

int i = 0;

boolean up, down, left, right;
boolean search = false;

float pos_ia_X, pos_ia_Y;

void setup(){
	size(600,600);
	for(int k = 0; k<5; k++){
		posX_cercle[k] = 1000;
		posY_cercle[k] = 1000;
	}

}

void draw(){
	translate(300,300);
	background(51);

	if(up == true)tmpY_cercle-=3;
	if(right == true)tmpX_cercle+=3;
	if(down == true)tmpY_cercle+=3;
	if(left == true)tmpX_cercle-=3;

	if(i<5){
		fill(253,106,3);
		ellipse(tmpX_cercle, tmpY_cercle, 20,20);
		for(int k = 0; k<5; k++){
			fill(253,106,3);
			ellipse(posX_cercle[k], posY_cercle[k], 20,20);
		}
	}

	else{
		for(int k = 0; k<5; k++){
			fill(253,106,3);
			ellipse(posX_cercle[k], posY_cercle[k], 20,20);
		}
	}


	if(search == true && i >= 5){
		for(int n = 0; n<5; n++){
			ia_index[n] = int(dist(0, 0, posX_cercle[n], posY_cercle[n]));

		}

	}

	

}
void keyPressed(){
	
	if(keyCode == ENTER){
		if(i<5){
			posX_cercle[i] = tmpX_cercle;
			posY_cercle[i] = tmpY_cercle;
			i++;
			tmpX_cercle = 0;
			tmpY_cercle = 0;
		}

		else if(i>=5){
			
		}
		
	}

	if(keyCode == UP)up = true;
	if(keyCode == RIGHT)right = true;
	if(keyCode == DOWN)down = true;
	if(keyCode == LEFT)left = true;

	if(key == 'a'){
		println("\n");
		println(posX_cercle);
		println("\n");
		println(posY_cercle);
		println("\n");
		println(ia_index);
	}

	if(key == ' '){
		search = true;
	}


}
void keyReleased(){
	if(keyCode == UP)up = false;
	if(keyCode == RIGHT)right = false;
	if(keyCode == DOWN)down = false;
	if(keyCode == LEFT)left = false;

}