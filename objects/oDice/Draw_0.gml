//Draw Dice
draw_self();

//Draw Text
setupText(fnNumber,fa_center,fa_middle,dice.color,image_alpha);
if diceNum != undefined then draw_text(x,y,diceNum);

//Reset Draw
resetDraw();
