//Draw Background
draw_set_color(c_black);
draw_set_alpha(.8*image_alpha);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);
drawReset(); //Quick Reset

//Draw Borders
draw_set_color(c_black);
draw_set_alpha(image_alpha);
var _borderH = 80 * borderEase;
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,_borderH,false);
draw_rectangle(SCREEN_EDGE.left,SCREEN_HEIGHT - _borderH,SCREEN_EDGE.right,SCREEN_HEIGHT,false);
drawReset(); //Quick Reset

//Draw Triangle
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Draw Triangle Flash
shader_set(shFlash);
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha * triFlash);
shader_reset();

//Draw Text
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Draw Electric Thing
elecFrame += sprite_get_speed(sMiniBossElec) / 60;
draw_sprite_ext(sMiniBossElec,elecFrame,x+110,y-110,image_xscale,image_yscale,image_angle,image_blend,image_alpha);