//Draw Dice
draw_self();

//Draw Text
textSetup(fnNumber,fa_center,fa_middle,dice.color,image_alpha);
if diceNum != undefined then draw_text_transformed(x,y,diceNum,image_xscale,image_yscale,image_angle);

//Reset Draw
drawReset();

//Draw Lock On
if isTargeted and state == diceStates.idle
{
    //Frames
    lockOnFrames += sprite_get_speed(sDiceLockOn)/60;
    
    //Alpha
    lockOnAlpha = lerp(lockOnAlpha,1,.3);
} else lockOnAlpha = lerp(lockOnAlpha,0,.3);

//Draw Lock On Sprite
draw_sprite_ext(sDiceLockOn,lockOnFrames,x,y,1,1,0,image_blend,lockOnAlpha);