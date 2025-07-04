condition();

if canHover and canPress
{
    //Juice
    var _growSize = .5;
    squash(image_xscale+_growSize,image_yscale+_growSize);
    textSize += _growSize;
    
    pressed = true;
    
} else shake += 5;
