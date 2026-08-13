//Draw Laser
if !beamClash
{
    draw_self();
} else {
    
    //Cut Laser
    var _cutAmount = 230;
    var _yscale = abs(_cutAmount / sprite_height) * image_yscale;
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,_yscale,image_angle,image_blend,image_alpha);
    
    //Draw Clash
    if targetEnemy and beamSprite != noone
    {
        draw_sprite(beamSprite,beamFrame,x + 3,y - _cutAmount);
        
        //Frame Looped
        if beamFrame >= sprite_get_number(beamSprite)-1
        {
            //Change Sprite
            if beamSprite == sLaserClashStart then beamSprite = sLaserClashLoop;
            if beamSprite == sLaserClashEnd then beamSprite = noone;
            
            //Reset Frame
            beamFrame = 0;
        } else beamFrame += beamSpd;
    }
    
}