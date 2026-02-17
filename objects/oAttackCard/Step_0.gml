//Move To Target Pos
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);

//Animate
x += animGetValue(acCard,curvePos,"shake")*7;

//Rotate
var _angle = (xprevious - x);
image_angle = lerp(image_angle,_angle,.2);

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-6,6);
shadowX = lerp(shadowX,_shadowX,.2);

//Flash
if flashAlpha > 0 then flashAlpha -= 0.03;

//Ease
image_xscale = lerp(image_xscale,1,.3);
image_yscale = lerp(image_yscale,1,.3);
angle = lerp(angle,0,.2);
shake = lerp(shake,shakeTarget,shakeEase);

//Hover
hover = touchingMouse() and canGrab and !instance_exists(oTipBox);

//Draw Info
drawCardText(card.info);