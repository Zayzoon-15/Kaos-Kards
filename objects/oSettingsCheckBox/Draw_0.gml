
//Get Can Click
var _color = c_white;
if !canClick then _color = c_gray;

//Draw Self
draw_self();

//Draw Text
setupText(fnMain,fa_left,fa_middle,_color,image_alpha);
draw_text_transformed(bbox_right + 10,y,text,textXScale,textYScale,0);

//Draw Gray Box
if !canClick
{
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,.5);
}

//Reset Draw
resetDraw();