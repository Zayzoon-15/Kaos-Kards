//Move To Target Pos
x = lerp_dt(x,targetX,.2);
y = lerp_dt(y,targetY,.2);

//Animate
x += animGetValue(acCard,curvePos,"shake")*7;

//Rotate
var _angle = (xprevious - x);
image_angle = lerp_dt(image_angle,_angle,.2);

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-6,6);
shadowX = lerp_dt(shadowX,_shadowX,.2);

//Flash
if flashAlpha > 0 then flashAlpha -= 0.03;

//Ease
image_xscale = lerp_dt(image_xscale,1,.3);
image_yscale = lerp_dt(image_yscale,1,.3);
angle = lerp_dt(angle,0,.2);
shake = lerp_dt(shake,shakeTarget,shakeEase);