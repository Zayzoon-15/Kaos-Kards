//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Button
draw_sprite_ext(sprite_index,image_index,x+_shakeX,y+_shakeY,xscale,yscale,angle,image_blend,image_alpha);