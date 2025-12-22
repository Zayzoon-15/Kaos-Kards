//Hide If Healthbar Isnt Real
if healthInst == noone
{
    visible = false;
    exit;
} else visible = true;

//Get Target Array
targetArray = global.playerHpIcons;
if target == "Enemy" then targetArray = global.enemyHpIcons;

//Clamp Id
var _index = array_get_index(targetArray, info)
iconId = _index;

//Center Icons
var _center = healthInst.y+5;
var _height = 50;
var _gap = _height/2;

var _top = _center - _gap * (array_length(targetArray)-1)/2;
var _y = _top + iconId * _gap;

//Set Position
targetX = healthInst.bbox_right + 10;
if healthInst.flipped then targetX = healthInst.bbox_left - 10;
targetY = _y;

//Ease
x = lerp(x,targetX,.3);
y = lerp(y,targetY,.1);

//Destroy
if !array_contains_value(targetArray,info)
{
    //Create Inst
	var _inst = instance_create_layer(x,y,"Effects",oHealthIconExit);
    _inst.healthInst = healthInst;
    _inst.sprite_index = sprite_index;
    _inst.x = x;
    _inst.y = y;
	
	with oHealthIcon
	{
		print(info.name,iconId);
	}
    
    //Destroy
    instance_destroy();
}