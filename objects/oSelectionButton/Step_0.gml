
if canPress
{
    if touchingMouse()
    {
        y = lerp(y,ystart-3,.3);
        shadowY = lerp(shadowY,8,.3);
    } else {
        y = lerp(y,ystart,.2);
        shadowY = lerp(shadowY,5,.2);
    } 
} else y = lerp(y,ystart+2,.2);

if canPress
{
    image_index = 0;
} else image_index = 1;

if targetEnemy == undefined
{
    canPress = false;
} else canPress = true;

image_xscale = lerp(image_xscale,xscaleStart,.3);
image_yscale = lerp(image_yscale,yscaleStart,.3);
