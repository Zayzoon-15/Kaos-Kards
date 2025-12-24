//Draw Arm
var _x = getPosToWindow(handId,x);
var _w = (point_distance(_x,y,x,y)+10) / sprite_get_width(sRpsArm);
var _dir = sign(image_xscale);
if (handId == 0 and _x < x) or (handId == 1 and _x > x)
{
    draw_sprite_ext(sRpsArm,0,_x,y,_w*_dir,image_yscale,0,image_blend,image_alpha);
}
   
//Draw Hand
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Draw Name Tag
textSetup(fnMain,fa_center,fa_bottom,c_white,nameTagAlpha);
var _textX = handId == 0 ? x + 500 : x - 500;
var _textY = y - (sprite_height*.8);
var _textString = handId == 1 ? "PLAYER" : "ENEMY";
draw_text_transformed(_textX,_textY,_textString,2,2,0);
draw_sprite_ext(sBrawlTri,0,_textX,_textY+20,2,2,0,c_white,nameTagAlpha);

//Reset Draw
drawReset();