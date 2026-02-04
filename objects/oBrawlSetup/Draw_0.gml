//Draw Map
draw_self();

//Draw Overlay
if fade
{
	alpha = lerp_dt(alpha,1,.08);
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,alpha);
}