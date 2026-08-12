//Draw Laser
if !beamClash
{
    draw_self();
} else { //Draw Laser Cut Due To Clash
    
    var _cutAmount = 200;
    
    //Position
    var _x = (x - sprite_xoffset);
    var _y = (y - sprite_yoffset) + (sprite_height - _cutAmount) * image_yscale;
    
    //Sizes
    var _top = sprite_height - _cutAmount//image_yscale == 1 ? sprite_height - _cutAmount : 0;
    var _height = _cutAmount * image_yscale;
    
    //Draw Laser
	draw_sprite_part_ext(sprite_index,image_index,0,_top,sprite_width,_height,_x,_y,image_xscale,image_yscale,image_blend,image_alpha);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,.2);
}
