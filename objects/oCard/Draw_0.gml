//Shake
randomize();
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+shadowX+_shakeX, y+shadowY+_shakeY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, .7);

//Draw Self
draw_sprite_ext(sprite_index, image_index, x+_shakeX, y+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//Warn Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

if showWarnText 
{
    draw_text(x,bbox_top,"Can not be placed\nunless condition met!");
}

rangeTextSize = lerp(rangeTextSize,1,.2);

if showRange
{
    draw_set_font(fnNumber);
    draw_text_transformed(x,slot.y-90,currentRange,rangeTextSize,rangeTextSize,0);
}