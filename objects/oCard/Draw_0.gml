//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp_dt(shake,0,.3);

//Set Exact Value If Following Dice
if followingDice
{
    cardX = x;
    cardY = y;
}

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, cardX+shadowX+_shakeX, cardY+shadowY+_shakeY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);

//Draw Self
draw_sprite_ext(sprite_index, image_index, cardX+_shakeX, cardY+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//Draw Disable
if !canUse
{
    draw_sprite_ext(sprite_index, image_index, cardX+_shakeX, cardY+_shakeY, image_xscale, image_yscale, image_angle, c_red, image_alpha*.2);
    draw_sprite_ext(sCardDisable,0,cardX+_shakeX, cardY+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}

//Draw Value
rangeScale = lerp_dt(rangeScale,1,.2);
if currentValue != undefined
{
    textSetup(fnNumberOutline,fa_center,fa_middle);
    draw_text_transformed(x,bbox_top - 40,currentValue,rangeScale,rangeScale,image_angle);
}

