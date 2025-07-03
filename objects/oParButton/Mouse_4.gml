
if canHover
{
    pressed = true;
    
    var _growSize = .5;
    squash(image_xscale+_growSize,image_yscale+_growSize);
    textSize += _growSize;
} else shake += 5;