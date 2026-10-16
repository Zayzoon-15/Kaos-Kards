//Draw Dice
draw_self();

//Draw Dice Number
textSetup(fonts.number, fa_center, fa_middle, diceType.color, image_alpha);
if diceNum != undefined {
    draw_text_transformed(x, y, diceNum, image_xscale, image_yscale, image_angle);
}

//Reset Draw
drawReset();

//Draw Lock On
draw_sprite_ext(sDiceLockOn, lockOnFrame, x, y, 1, 1, 0, image_blend, lockOnAlpha);