//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Card
if grabbed
{
    //Draw Shadow
    draw_sprite_ext(sprite_index, image_index, cardX+shadowX+_shakeX, cardY+shadowY+_shakeY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);
    
    //Draw Card
    draw_sprite_ext(sprite_index, image_index, cardX+_shakeX, cardY+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    //Draw Placed
    if placed and showPlaced
    {
        draw_sprite_ext(sprite_index, image_index, cardX+_shakeX, cardY+_shakeY, image_xscale, image_yscale, image_angle, c_black, image_alpha*.5);
    }
    
} else {
    //Draw Shadow
    var _scaleX = cos(degtorad(cardAngle));
    draw_sprite_ext(sprite_index, image_index, cardX+shadowX+_shakeX, cardY+shadowY+_shakeY, (image_xscale-shadowSize)*_scaleX, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);
    
    //Draw Card
	drawCard3d(cardX+_shakeX, cardY+_shakeY, cardFront, cardBack, cardAngle,image_angle,8,image_blend,image_alpha);
    
    //Draw Placed
    if placed and showPlaced
    {
        drawCard3d(cardX+_shakeX, cardY+_shakeY, cardFront, cardBack, cardAngle,image_angle,8,c_black,image_alpha*.5);
    }
}

drawReset();

