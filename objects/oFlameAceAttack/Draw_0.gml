//Draw Flame
draw_self();

//Draw Card
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(sAce,0,x,y,image_xscale,image_yscale,image_angle,image_blend*.8,image_alpha);

//Reset Draw
resetDraw();