//Dont Draw
if !cardVisible and oDeckBuilder.transition then exit;

//Set Scissor
var _scissor = gpu_get_scissor();
if !grabbed and !oDeckBuilder.transition and instance_exists(oDBContainer) then gpu_set_scissor(oDBContainer.scissorStuct);
if !grabbed and !oDeckBuilder.transition and instance_exists(oDBDeck) then gpu_set_scissor(oDBDeck.scissorStuct);

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
} else {
    //Draw Shadow
    var _scaleX = cos(degtorad(cardAngle));
    draw_sprite_ext(sprite_index, image_index, cardX+shadowX+_shakeX, cardY+shadowY+_shakeY, (image_xscale-shadowSize)*_scaleX, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);
	
    //Draw Card
	drawCard3d(cardX+_shakeX, cardY+_shakeY, cardFront, cardBack, cardAngle,image_angle);
    
    //Draw Card Amount
    if room == rDeckBuilder1
    {
        //Values
        var _amountString = $"{maxCardAmount-cardAmount}x";
        var _amountPos = new Vector2((cardX+sprite_width/2)-10,(cardY+sprite_height/2)-10);
        var _amountWidth = 13;
        var _amountHeight = 12;
        
        //Draw Bg
        drawRectOutlined(_amountPos.x-_amountWidth,_amountPos.y-_amountHeight,_amountPos.x+_amountWidth,_amountPos.y+_amountHeight);
        
        //Draw Text
        textSetup(fnMain,fa_center,fa_middle);
        draw_text(_amountPos.x+1,_amountPos.y,_amountString);
    }
}

//Reset Scissor
gpu_set_scissor(_scissor);