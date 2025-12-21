
//Draw Character
draw_sprite_ext(sprite_index,image_index,x,y,xscale*dir,yscale,image_angle,image_blend,image_alpha);


//Draw Invisible Brightness
if sprite_index != sprites.hit
{
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,image_index,x,y,xscale*dir,yscale,image_angle,image_blend,image_alpha*invisFlash);
	gpu_set_blendmode(bm_normal);
}