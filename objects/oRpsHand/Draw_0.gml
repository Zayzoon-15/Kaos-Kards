//Draw Arm
var _x = getPosToWindow(handId,x);
var _w = (point_distance(_x,y,x,y)+10) / sprite_get_width(sRpsArm);
var _dir = sign(image_xscale);
if (handId == 0 and _x < x) or (handId == 1 and _x > x)
{
    draw_sprite_ext(sRpsArm,0,_x,y,_w*_dir,image_yscale,0,image_blend,image_alpha);
}
   
//Draw Hand
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
