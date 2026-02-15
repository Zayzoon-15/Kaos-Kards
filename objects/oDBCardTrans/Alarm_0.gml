///@desc Leave Animation

//Move
var _offset = 50;
var _x = room == rDeckBuilder1 ? oDBInsertHole.x - _offset : oDBInsertHole.x + _offset;
TweenEasyMove(x,y,_x,oDBInsertHole.y,0,20,EaseInBack);

//Fade
TweenEasyFade(1,0,15,10,EaseLinear);