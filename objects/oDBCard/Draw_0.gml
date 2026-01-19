//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Card
if grabbed
{
    //Draw Shadow
    draw_sprite_ext(sprite_index, image_index, cardX+shadowX+_shakeX, cardY+shadowY+_shakeY, (image_xscale* xscale)-shadowSize, (image_yscale*yscale)-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);
    
    //Draw Card
    draw_sprite_ext(sprite_index, image_index, cardX+_shakeX, cardY+_shakeY, image_xscale*xscale, image_yscale*yscale, image_angle, image_blend, image_alpha);
} else {
    //Draw Shadow
    var _scaleX = cos(degtorad(cardAngle));
    draw_sprite_ext(sprite_index, image_index, cardX+shadowX+_shakeX, cardY+shadowY+_shakeY, ((image_xscale* xscale)-shadowSize)*_scaleX, (image_yscale*yscale)-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);
	
    //Draw Card
	drawCard3d(cardX+_shakeX, cardY+_shakeY, cardFront, cardBack, cardAngle,image_angle, cardThickness);
}




////Set Scissor
//var _scissor = gpu_get_scissor();
//if !grabbed then gpu_set_scissor(oDBContainer.scissorStuct);
//
//#region Draw Card
//
////Shake
//var _shakeX = random_range(-1,1)*shake;
//var _shakeY = random_range(-1,1)*shake;
//shake = lerp(shake,0,.3);
//
////Draw Shadow
//draw_sprite_ext(sprite_index, image_index, cardX+shadowX+_shakeX, cardY+shadowY+_shakeY, (image_xscale* xscale)-shadowSize, (image_yscale*yscale)-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);
//
////Draw Self
//draw_sprite_ext(sprite_index, image_index, cardX+_shakeX, cardY+_shakeY, image_xscale*xscale, image_yscale*yscale, image_angle, image_blend, image_alpha);
//
//#endregion
//
////Reset Scissor
//gpu_set_scissor(_scissor);