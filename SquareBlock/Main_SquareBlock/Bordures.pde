void bordure_rouges(){
  if(PosRed_X<0) PosRed_X=580;
  if(PosRed_X>580) PosRed_X=0;
  if(PosRed_Y<0) PosRed_Y=580;
  if(PosRed_Y>580) PosRed_Y=0;
}

void bordure_bleu(){
  if(PosBlue_X<0) PosBlue_X=580;
  if(PosBlue_X>580) PosBlue_X=0;
  if(PosBlue_Y<0) PosBlue_Y=580;
  if(PosBlue_Y>580) PosBlue_Y=0;
}