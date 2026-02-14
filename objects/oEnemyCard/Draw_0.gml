//Draw Shadow
var _scaleX = cos(degtorad(cardAngle));
draw_sprite_ext(sprite_index, image_index, cardX+shadowX, cardY+shadowY, (image_xscale-shadowSize)*_scaleX, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);

//Draw Card
drawCard3d(cardX, cardY, sprite_index, sDeck, cardAngle, image_angle);


//Draw Value
if value != undefined
{
    textSetup(fnNumberOutline,fa_center,fa_middle);
    draw_text_transformed(x,bbox_top - 40,value,1,1,image_angle);
    drawReset();
}