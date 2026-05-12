
alarm[0] = 20;


ripOneX = 0;
ripOneY = 0;
ripTwoX = 0;
ripTwoY = 0;


drawCardRip = function(_xPos = x,_yPos = y,_left = 0,_top = 0,_width = sprite_width,_height = sprite_height)
{
    
    var _x = _left - sprite_get_xoffset(sprite_index);
    var _y = _top - sprite_get_yoffset(sprite_index);
    var _c = dcos(image_angle);
    var _s = dsin(image_angle);
    draw_sprite_general(
        sprite_index,0,  //sprite and sub image
        _left,_top,  //left,right
        _width,_height,  //width,height
        (x+_c*_x+_s*_y)+_xPos,
        (y-_s*_x+_c*_y)+_yPos,
        1,1,  //scale
        image_angle,  //angle
        image_blend,image_blend,image_blend,image_blend,image_alpha  //colour and alpha
    );
    
}