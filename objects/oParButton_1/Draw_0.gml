//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Shadow
if drawShadow 
{
    
    var _shadowSize = .05;
    draw_sprite_ext(sprite_index,image_index,targetX+shadowX+_shakeX,targetY+shadowY+_shakeY,xscale-_shadowSize,yscale-_shadowSize,image_angle,c_black,image_alpha*SHADOW_ALPHA);
}

//Draw Self
draw_sprite_ext(sprite_index,image_index,targetX+boxX+_shakeX,targetY+boxY+_shakeY,xscale,yscale,image_angle,image_blend,image_alpha);

//Draw Text
textSetup(fnMain,fa_center,fa_middle,c_white,image_alpha);
draw_text_transformed(targetX+boxX+_shakeX,targetY+boxY+_shakeY,text,textXScale,textYScale,image_angle);


//Draw X
if !canHover then draw_sprite_ext(sButtonX,0,targetX+boxX+_shakeX,targetY+boxY+_shakeY,1,1,image_angle,c_white,1);

//Reset
drawReset();