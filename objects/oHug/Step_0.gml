//Ease Position
loner.x = lerp(loner.x,loner.targetX,.05);
loner.y = lerp(loner.y,loner.targetY,.05);
hugger.x = lerp(hugger.x,hugger.targetX,.05);
hugger.y = lerp(hugger.y,hugger.targetY,.05);

//Ease Alpha
loner.alpha = lerp(loner.alpha,loner.targetAlpha,.06);
hugger.alpha = lerp(hugger.alpha,hugger.targetAlpha,.06);

//Ease Scale
image_xscale = lerp(image_xscale,1,.1);
image_yscale = lerp(image_yscale,1,.1);