//Draw Shadow
var _shadowX = (x - (room_width/2))*.03;
_shadowX = clamp(_shadowX,-5,5);
draw_sprite_ext(sprite_index,image_index,x+_shadowX,y+2,image_xscale-.1,image_yscale-.1,image_angle,c_black,.7*image_alpha);

//Draw Sprite
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);