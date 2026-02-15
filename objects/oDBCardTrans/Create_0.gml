//Shadow
shadowX = 0;
shadowY = 0;
shadowSize = 0.05;

//Depth
depth = oDBInsertHole.depth + 1;

//Move To Start Position
var _offset = 100;
var _x = room == rDeckBuilder1 ? oDBInsertHole.x + _offset : oDBInsertHole.x - _offset;
TweenEasyMove(x,y,_x,oDBInsertHole.y,0,10,EaseOutCubic);

//Rotate
var _rotation = room == rDeckBuilder1 ? -90 : 90;
TweenEasyRotate(image_angle+360,_rotation,5,40,EaseOutBack);

//Leave Animation
alarm[0] = 35;