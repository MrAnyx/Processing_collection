//si une case est jouée, elle passe a 1 si les O jouent et 2 si les X jouent

int[][] board = new int[3][3];
int joueur = 1; // Les O commencent



void setup(){

    size(600,600);

    //initialisation du tableau
    for(int i = 0; i<3; i++){
        for(int j = 0; j<3; j++){
            board[i][j] = 0;
        }
    }





}

void drawCross(int x, int y){
    fill(0);
    strokeWeight(20);

    line(x+30, y+30, x+170, y+170);
    line(x+30, y+170, x+170, y+30);
}

void drawCircle(int x, int y){
    noFill();
    stroke(0);
    strokeWeight(20);
    ellipse(x+100, y+100, 140,140);
}

void drawSign(){
    for(int i = 0; i<3; i++){
        for(int j = 0; j<3; j++){

            if(board[i][j] == 1){
                drawCircle(i*200, j*200);
            }
            else if(board[i][j] == 2){
                drawCross(i*200, j*200);
            }
        }
    }
}

void drawBoard(){
    fill(0);
    strokeWeight(5);
    line(200, 15, 200, 585);
    line(400, 15, 400, 585);
    line(15, 200, 585, 200);
    line(15, 400, 585, 400);
}


void draw(){
    background(200,200,200);
    drawBoard();
    drawSign();

    if(mousePressed && mouseButton == LEFT && joueur == 1){
        board[floor(mouseX/200)][floor(mouseY/200)] = joueur;
    }
    else if(!mousePressed && joueur == 1){
        joueur = 2;
    }

    else if(mousePressed && mouseButton == LEFT && joueur == 2){
        board[floor(mouseX/200)][floor(mouseY/200)] = joueur;
    }
    else if(!mousePressed && joueur == 2){
        joueur = 1;
    }



}
