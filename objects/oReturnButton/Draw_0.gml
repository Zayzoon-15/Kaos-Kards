
draw_set_alpha(image_alpha);

//Draw Shadow
if canPress
{
    draw_sprite_ext(sprite_index, image_index, x, y+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, .7*image_alpha);
}

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnMain);

textScale = lerp(textScale,2,.3);

draw_text_transformed(x,y,"Enemy Select",textScale,textScale,0);

draw_set_alpha(1);

if !canPress
{
    draw_sprite(sXButton,0,x,y);
}

