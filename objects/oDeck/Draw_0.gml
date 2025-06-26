
randomize();
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;

draw_sprite_ext(sprite_index, image_index, x+_shakeX, y+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);


#region Info Text

//Setup Text
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnMain);

//Draw Text
draw_text(x+_shakeX,bbox_bottom+_shakeY,$"{cardsPicked}/{totalCards}");

#endregion



