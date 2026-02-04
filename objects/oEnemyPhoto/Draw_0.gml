//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp_dt(shake,0,.15);

//Draw Self
draw_sprite_ext(sprite_index,image_index,x+_shakeX,y+_shakeY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);