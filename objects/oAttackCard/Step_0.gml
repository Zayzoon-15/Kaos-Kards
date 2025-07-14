
//Move To Target Pos
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);


//Rotate
var _angle = (xprevious - x);
image_angle = lerp(image_angle,_angle,.2);


//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-6,6);
shadowX = lerp(shadowX,_shadowX,.2);