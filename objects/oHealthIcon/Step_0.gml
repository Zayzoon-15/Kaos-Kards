//Hide If Healthbar Isnt Real
if healthInst == noone
{
    visible = false;
    exit;
} else visible = true;

//Get Target Array
var _array = global.playerHpIcons;
if target == "Enemy" then _array = global.enemyHpIcons;

//Clamp Id
iconId = clamp(iconId,0,array_length(_array)-1);

//Center Icons
var _center = healthInst.y+5;
var _height = 65;
var _gap = _height/2;

var _top = _center - _gap * (array_length(_array)-1)/2;
var _y = _top + iconId * _gap;

//Set Position
targetX = healthInst.bbox_right + 10;
if healthInst.flipped then targetX = healthInst.bbox_left - 10;
targetY = _y;

//Ease
x = lerp(x,targetX,.3);
y = lerp(y,targetY,.1);

//Destroy
if !array_contains_value(_array,info)
{
	instance_create_layer(x,y,"Effects",oHealthIconPop,{
		sprite_index : sprite_index
	});
    instance_destroy();
}