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
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);

//Position
targetX = room_width/2 + 290;
targetY = room_height/2;