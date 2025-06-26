//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;

draw_sprite_ext(sprite_index,image_index,x+_shakeX,y+_shakeY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Draw Text
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnMain);

draw_text(x,bbox_top,$"{discards}/{maxDiscrads}");

