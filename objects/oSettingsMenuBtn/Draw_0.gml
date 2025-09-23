//Shake
randomize();
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Self
draw_sprite_ext(sprite_index,image_index,boxX+_shakeX,boxY+_shakeY,xscale,yscale,image_angle,image_blend,image_alpha);

//Draw Text
setupText(fnMain,fa_center,fa_middle,c_white,image_alpha);
draw_text_transformed(boxX+_shakeX,boxY+_shakeY,text,textSize,textSize,0);

//Reset
resetDraw();