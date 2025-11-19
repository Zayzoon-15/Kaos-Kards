
//Draw Shadow
draw_sprite_ext(sprite_index, image_index, cardX+shadowX, cardY+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, image_alpha*SHADOW_ALPHA);

//Draw Self
draw_sprite_ext(sprite_index, image_index, cardX, cardY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//Draw Value
if value != undefined
{
    textSetup(fnNumberOutline,fa_center,fa_middle);
    draw_text_transformed(x,bbox_top - 40,value,1,1,image_angle);
    resetDraw();
}