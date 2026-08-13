//Move To Target Pos
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);

//Animate
x += animGetValue(animCurve, curvePos, 0)*7;

//Rotate
var _angle = rotAngle ? (xprevious - x) : 0;
image_angle = lerp(image_angle,_angle,.2);

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-6,6);
shadowX = lerp(shadowX,_shadowX,.2);

//Flash
if flashAlpha > 0 then flashAlpha -= 0.03;

//Ease
image_xscale = lerp(image_xscale,targetScale,.3);
image_yscale = lerp(image_yscale,targetScale,.3);
angle = lerp(angle,0,.2);
shake = lerp(shake,shakeTarget,shakeEase);

//Set Hover
hover = touchingMouse();

//Card Hover Stuff
if hoverCard
{
    drawCardText(info);
}
