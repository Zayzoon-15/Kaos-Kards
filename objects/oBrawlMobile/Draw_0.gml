//Draw Self
draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha);

//Draw Dark
if held
{
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,c_black,image_alpha*.2);
}