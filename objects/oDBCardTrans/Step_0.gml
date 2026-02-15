//Shadow
var _shadowX = (x - (room_width/2))*.05;
shadowX = clamp(shadowX,-10,10);
shadowX = lerp(shadowX,_shadowX,.2);
shadowY = lerp(shadowY,15,.2);
shadowSize = lerp(shadowSize,0.08,.2);