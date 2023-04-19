
float accel = 9.81;
float speed = 0;
float pos = 50;

void setup(){
	size(200,800);
	

}

void draw(){
	background(51);

	speed-=accel;
	pos -= speed;

	ellipse(100, pos, 20,20);


	
}