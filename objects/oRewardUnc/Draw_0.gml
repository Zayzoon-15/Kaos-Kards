//Draw Background
draw_set_colour(c_black);
draw_set_alpha(bgAlpha);
draw_rectangle(CAMERA_POS.x,CAMERA_POS.y,SCREEN_EDGE.right,SCREEN_HEIGHT,false);
drawReset(); //Quick Reset

//Draw Hand
draw_sprite_ext(handSprite,handImage,handX,handY,handXScale,handYscale,handAngle,image_blend,image_alpha);

//Draw Pickle
draw_self();

//Draw Blush
draw_sprite_ext(sRewardUncBlush,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,blushAlpha * image_alpha);

//Draw Darkness
draw_set_alpha(bgAlpha);
draw_sprite_stretched(sRewardDarkeness,0,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
drawReset(); //Quick Reset
