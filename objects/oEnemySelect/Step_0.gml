
//Hover
if (touchingMouse() or selected) and !locked and !global.showCards
{
    y = lerp(y,ystart-10,.2);
    shadowY = lerp(shadowY,15,.3);
} else
{
    y = lerp(y,ystart,.2);
    shadowY = lerp(shadowY,5,.2);
} 

if !locked
{
    if selected
    {
        sprite_index = spriteSelected;
    } else sprite_index = spriteIdle;
} else sprite_index = spriteLocked;

if global.midTrans
{
    canPress = false;
} else canPress = true;

//Ease
image_xscale = lerp(image_xscale,scale,.2);
image_yscale = lerp(image_yscale,scale,.2);

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = lerp(shadowX,_shadowX,.2);
shadowX = clamp(shadowX,-7,7);
