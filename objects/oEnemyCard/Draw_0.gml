//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+shadowX, y+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, .7);

//Draw Self
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//Warn Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);


rangeTextSize = lerp(rangeTextSize,1,.2);

if showRange
{
    draw_set_font(fnNumber);
    draw_set_alpha(rangeAlpha);
    draw_text_transformed(x,ystart-90,currentRange,rangeTextSize,rangeTextSize,0);
    draw_set_alpha(1);
}