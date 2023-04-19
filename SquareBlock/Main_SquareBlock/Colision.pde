void colision(){
  for(int i = 0; i<30; i++){
     if(PosRed_X == tab_bleu_X[i] && PosRed_Y == tab_bleu_Y[i]){ //si le carré rouge touche une bande bleu
        stop(); //on arrete le programme
        fill(#3437B2, 150);
        rect(0,0,605,605);
        fill(0);
        textSize(35);
        textAlign(CENTER,CENTER);
        text("Le joueur Bleu a gagné !!",0,0, width, height);
     }
     if(PosBlue_X == tab_rouge_X[i] && PosBlue_Y == tab_rouge_Y[i]){ //si le carré bleu touche une bande rouge
        stop();
        fill(#B23438, 150);
        rect(0,0,605,605);
        fill(0);
        textSize(35);
        textAlign(CENTER,CENTER);
        text("Le joueur Rouge a gagné !!",0,0, width, height);
     }
  }
}