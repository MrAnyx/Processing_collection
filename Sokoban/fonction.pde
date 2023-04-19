void keyPressed(){
    if(keyCode == UP){
        if(tab[perso.x][perso.y-1] != 1)perso.y--;
    }
    if(keyCode == DOWN){
        if(tab[perso.x][perso.y+1] != 1)perso.y++;
    }
    if(keyCode == RIGHT){
        if(tab[perso.x+1][perso.y] != 1)perso.x++;
    }
    if(keyCode == LEFT){
        if(tab[perso.x-1][perso.y] != 1)perso.x--;
    }
}



void coordTab(){
    for(int i = 0; i<21; i++){
        for(int j = 0; j<13; j++){
            tab[i][j] = 0;
        }
    }

    for(int i = 5; i<=9; i++){tab[i][1] = 1;}
    for(int i = 2; i<=4; i++){tab[9][i] = 1;}
    for(int i = 4; i<=7; i++){tab[10][i] = 1;}
    for(int i = 11; i<=14; i++){tab[i][7] = 1;}
    for(int i = 14; i<=19; i++){tab[i][6] = 1;}
    for(int i = 6; i<=10; i++){tab[19][i] = 1;}
    for(int i = 11; i<=19; i++){tab[i][10] = 1;}
    for(int i = 13; i<=14; i++){tab[i][9] = 1;}
    tab[11][9] = 1;
    for(int i = 5; i<=11; i++){tab[i][11] = 1;}
    for(int i = 9; i<=11; i++){tab[5][i] = 1;}
    for(int i = 1; i<=5; i++){tab[i][9] = 1;}
    for(int i = 6; i<=9; i++){tab[1][i] = 1;}
    for(int i = 1; i<=3; i++){tab[i][6] = 1;}
    for(int i = 4; i<=6; i++){tab[3][i] = 1;}
    for(int i = 3; i<=5; i++){tab[i][4] = 1;}
    for(int i = 1; i<=4; i++){tab[5][i] = 1;}

    for(int i = 7; i<=8; i++){
        for(int j = 6; j<=7; j++){
            tab[i][j] = 1;
        }
    }
    for(int i = 7; i<=9; i++){tab[i][9] = 1;}
    for(int i = 6; i<=7; i++){tab[5][i] = 1;}

}
