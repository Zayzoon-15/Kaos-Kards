//Draw Shadow
draw_sprite_ext(sprite_index,image_index,x-5,y+10,image_xscale-.05,image_yscale-.05,image_angle,c_black,SHADOW_ALPHA);

//Draw Capsule
draw_self();

//Draw Tourney Name
textSetup(fnMain,fa_left,fa_top,c_dkgray);
draw_text_transformed(bbox_left+10,bbox_top+10,info.name,2,2,0);



/*
//DEBUG
draw_text(x,bbox_top,$"ID:{capsuleId}\nPLACEMENT:{capsuleId - oTourneySelector.selectedCapsule}");

