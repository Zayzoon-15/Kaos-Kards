

//Shake
randomize();
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;

//Draw Shadow
if canPress
{
    draw_sprite_ext(sprite_index, image_index, x+_shakeX, y+_shakeY+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, .7*image_alpha);
}

//Draw Self
draw_sprite_ext(sprite_index, image_index, x+_shakeX, y+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//Set Alpha
draw_set_alpha(image_alpha);

//Draw Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnMain);

textScale = lerp(textScale,2,.3);

draw_text_transformed(x+_shakeX,y+_shakeY,"Done",textScale,textScale,0);

draw_set_alpha(1);

if !canPress
{
    draw_sprite(sXButton,0,x,y);
}

