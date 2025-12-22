
//Draw Character
draw_sprite_ext(sprite_index,image_index,x,y,xscale*dir,yscale,image_angle,image_blend,image_alpha);


//Draw Invisible Brightness
if sprite_index != sprites.hit
{
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,image_index,x,y,xscale*dir,yscale,image_angle,image_blend,image_alpha*invisFlash);
	gpu_set_blendmode(bm_normal);
}

//Draw Character Number
textSetup(fnMain,fa_center,fa_bottom,c_white,textAlpha);
var _x = x + 5*dir;
var _y = bbox_top - 7;

draw_text(_x,_y-4,playerId + 1);
draw_triangle(_x+5,_y-5,_x-5,_y-5,_x,_y,false);

//Reset Draw
drawReset();