//Tease Unc (⸝⸝๑﹏๑⸝⸝)
if point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top+10,bbox_right,bbox_top+400)
{
    var _speed = window_mouse_get_delta_x();
    
    
    if _speed > 4 and lastMousDir != 1
    {
        blushTargetAlpha += .1;
        lastMousDir = 1;
    }
    
    if _speed < -4 and lastMousDir != -1
    {
        blushTargetAlpha += .1;
        lastMousDir = -1;
    }

    
    blushTargetAlpha -= .01;
} else {
	blushTargetAlpha -= .04;
}

blushTargetAlpha = clamp(blushTargetAlpha,-.7,1.5);
blushAlpha = lerp(blushAlpha,blushTargetAlpha,.3);
