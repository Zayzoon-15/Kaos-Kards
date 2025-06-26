/// @desc Draw Vol
if (shake > 0)
{
    draw_sprite_ext( sprite_index, image_index, x + irandom_range(-shake, shake),
	y + irandom_range(-shake, shake), 1, 1, image_angle,
	image_blend, image_alpha);
} else
{
	draw_sprite_ext(sprite_index,image_index,x,y,
	1, 1, image_angle, image_blend,image_alpha);
}

depth = -999;