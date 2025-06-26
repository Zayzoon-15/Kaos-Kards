
//Rotate
var _angle = (xprevious - x);
image_angle = lerp(image_angle,_angle,.2);

//Shadow
var _shadowX = (x - (room_width/2))*.05;
shadowX = clamp(shadowX,-10,10);
shadowX = lerp(shadowX,_shadowX,.2);
shadowY = lerp(shadowY,15,.2);
shadowSize = lerp(shadowSize,0.08,.2);

//Ease
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);


//Animation Curve
var _curveStruct = animcurve_get(acAttackCard);
var _channel = animcurve_get_channel(_curveStruct,"shield");
var _value = animcurve_channel_evaluate(_channel,curvePos);

if animateCard
{
    curvePos += curveSpd;
    
    targetX = startingX + (_value*8);
    
    x = lerp(x,targetX,.3);
    y = lerp(y,targetY,.3);
    
} else {
	x = lerp(x,targetX,.3);
    y = lerp(y,targetY,.3);
}

//Position
targetX = room_width/2;
targetY = room_height/2;