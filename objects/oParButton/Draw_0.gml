//Shake
randomize();
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Shadow
var _shadowSize = .05;
draw_sprite_ext(sprite_index, image_index, x+shadowX+_shakeX, y+shadowY+_shakeY, xscale-_shadowSize, yscale-_shadowSize, image_angle, c_black, image_alpha*SHADOW_ALPHA);

//Draw Self
draw_sprite_ext(sprite_index,image_index,boxX+_shakeX,boxY+_shakeY,xscale,yscale,image_angle,image_blend,image_alpha);

//Draw Text
setupText(fnMain,fa_center,fa_middle,c_white,image_alpha);
draw_text_transformed(boxX+_shakeX,boxY+_shakeY,text,textSize,textSize,0);


//Draw X
if !canHover then draw_sprite(sButtonX,0,boxX+_shakeX,boxY+_shakeY);

//Reset
resetDraw();