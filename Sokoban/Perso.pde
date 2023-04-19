class Perso{
    int x;
    int y;
    int middleX, middleY;

    Perso(){
        x = 12;
        y = 11;
        middleX = x*35+13;
        middleY = y*35+13;
    }

    void show(){
        fill(255,0,0);
        rect(x*35+5, y*35+8, 25,25);
    }

}
