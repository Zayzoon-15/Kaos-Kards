//Inherit
event_inherited();

//Disabled
var _alpha = 1;
if disabled then _alpha = .5;

//Draw CheckBox
var _x = rectX2-(width+sprite_get_width(sSettingsCheckOn)/2);
draw_sprite_ext(sprite_index,image_index,_x,y,checkXScale,checkYScale,image_angle,image_blend,image_alpha*_alpha);