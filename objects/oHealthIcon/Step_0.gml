//Get Target Array
var _array = global.playerEffects;
if target == "Enemy" then _array = global.enemyEffects;

//Center Icons
var _center = healthInst.y+5;
var _height = 50;
var _gap = _height/(array_length(_array));

var _top = _center - _gap * (array_length(_array)-1)/2;
var _y = _top + iconId * _gap;

//Set Position
targetX = healthInst.bbox_right + 10;
targetY = _y;


//Ease
x = lerp(x,targetX,.3);
y = lerp(y,targetY,.1);