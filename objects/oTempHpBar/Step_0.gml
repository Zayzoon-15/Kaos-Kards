//Get Correct List
targetList = playerEffects;
if target == "Enemy" then targetList = enemyEffects;

//Get Values
var _hp, _tempHp;
if target == "Player"
{
    _hp = global.playerTempHp;
} else {
	_hp = global.enemyTempHp;
}

//Set Values
hp = lerp(hp,_hp,.2);

//Lerp Angle
angle = lerp(angle,0,.2);

#region Info Box

//Local Vars
var _string,_dist;

//Name
if target == "Player"
{
    _string = "Your Temp Health Bar";
} else _string = "Enemies Temp Health Bar";

//Distance
if tipOnTop
{
    _dist = 5;
} else _dist = 9;

//String
tipBoxString = $"{_string}\nTemp Health:{floor(_hp)}%";

//Draw Info
drawTipBox(tipBoxString,tipOnTop,_dist,1,true);

#endregion


//Move To Correct Position
if flipped
{
	var _camRight = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]);
	x = _camRight - (room_width - xstart);
} else x = camera_get_view_x(view_camera[0]) + xstart;

