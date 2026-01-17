//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+shadowX+_shakeX, y+shadowY+_shakeY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle+angle, c_black, image_alpha*SHADOW_ALPHA);

//Draw Self
draw_sprite_ext(sprite_index, image_index, x+_shakeX, y+_shakeY, image_xscale, image_yscale, image_angle+angle, image_blend, image_alpha);

//Draw Flash
shader_set(shFlash);

if flashAlpha > 0
{
    draw_sprite_ext(sprite_index, image_index, x+_shakeX, y+_shakeY, image_xscale, image_yscale, image_angle+angle, flashColor, flashAlpha);
}

shader_reset();
