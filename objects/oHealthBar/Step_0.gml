
//Get Values
var _hp, _tempHp;
if target == "Player"
{
    _hp = global.playerHp;
	_tempHp = global.playerTempHp;
} else {
	_hp = global.enemyHp;
	_tempHp = global.enemyTempHp;
}

//Get List
targetList = playerEffects;
if target != "Player" then targetList = enemyEffects;

//Set Values
hp = lerp(hp,_hp,.2);
tempHp = lerp(tempHp,_tempHp,.2);

//Lerp Angle
angle = lerp(angle,0,.2);

#region Info Box

//Local Vars
var _string,_dist;

//Name
if target == "Player"
{
    _string = "Your Health Bar";
} else _string = "Enemies Health Bar";

//Distance
if tipOnTop
{
    _dist = 5;
} else _dist = 9;

//String
tipBoxString = $"{_string}\nHealth:{floor(_hp)}%";
for (var i = 0; i < ds_list_size(targetList); ++i) {
	var _listValue = ds_list_find_value(targetList,i);
	var _amount = abs(_listValue.value);
	if _amount > 0
	{
		tipBoxString += $"\n{_listValue.info.name}:{floor(_listValue.percent)}%";
	}
}

//Draw Info
drawTipBox(tipBoxString,tipOnTop,true,_dist,1);

#endregion


//Move To Correct Position
if flipped
{
	x = getPosToWindow(true);
} else x = getPosToWindow(false);

