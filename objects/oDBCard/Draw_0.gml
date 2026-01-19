

//cardAngle += .5; 
//print(cardAngle)
//if cardAngle >= 360 then cardAngle -= 360;

drawCard3d(x, y, cardFront, cardBack, cardAngle, cardThickness);



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