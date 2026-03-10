//Setup
textSetup(fnMain,fa_left,fa_top,c_black,image_alpha);

//Get Dimensions
var _maxWidth = bbox_right - bbox_left;
var _bbH = bbox_bottom - bbox_top;
var _textH = string_height_ext(textShow,-1,_maxWidth);

//Get Box Growth Amount
var _boxGrowH = (_textH - _bbH);
if _boxGrowH < 0 then _boxGrowH = 0;

//Draw Box
draw_sprite_stretched(sprite_index,0,x,y,sprite_width,sprite_height+_boxGrowH);

//Draw Box Arrow
draw_sprite_ext(sprite_index,1,x,y,1,1,image_angle,image_blend,image_alpha);

//Draw Text
draw_text_ext(bbox_left,bbox_top,textShow,-1,_maxWidth);

//Reset Draw
drawReset();