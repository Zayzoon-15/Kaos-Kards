//Draw Dice
draw_self();

//Draw Text
textSetup(fnNumber,fa_center,fa_middle,dice.color,image_alpha);
if diceNum != undefined then draw_text_transformed(x,y,diceNum,image_xscale,image_yscale,image_angle);

//Reset Draw
resetDraw();
