#region Hover


//Hovered
if touchingMouse() and !global.holdingCard
{
    cardTargetY = ystart - 10;
    shadowY = lerp(shadowY,16,.2);
} else {
    cardTargetY = ystart;
    shadowY = lerp(shadowY,8,.2);
}

#endregion


#region Ease

//Position
cardX = x;
cardY = lerp(cardY,cardTargetY,.2);

//Scale
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);

#endregion


#region Drawing


//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-6,6);
shadowX = lerp(shadowX,_shadowX,.2);
shadowSize = lerp(shadowSize,0.05,.2);

#endregion


//Info Box
drawCardText(info);
