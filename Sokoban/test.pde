class test{
    int x,y;
    color couleur;

    test(){
        x = width/2;
        y = height/2;
        couleur = color(255,0,0);
    }

    void show(){
        fill(couleur);
        rect(x,y,20,20);
    }
}
