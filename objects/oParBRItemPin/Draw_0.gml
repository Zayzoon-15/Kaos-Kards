//Setup
var _pinAngle = image_angle/10;


//Draw Shadow
draw_sprite_ext(sprite_index,0,x+shadowOffset.x,y+shadowOffset.y,image_xscale-shadowSize,image_yscale-shadowSize,image_angle,c_black,SHADOW_ALPHA_BREAK_ROOM*image_alpha);

//Draw Self
draw_self();


//Draw Pin Shadow
draw_sprite_ext(sprite_index,1,x+2,y+1,image_xscale-0.05,image_yscale-0.05,_pinAngle,c_black,SHADOW_ALPHA_BREAK_ROOM*image_alpha);


//Draw Pin
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,_pinAngle,c_white,image_alpha);
