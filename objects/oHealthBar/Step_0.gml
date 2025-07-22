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

//Set Values
hp = lerp(hp,_hp,.2);
tempHP = lerp(tempHP,_tempHp,.2);

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
var _infoString = $"{_string}\nHealth:{floor(hp)}%";
if tempHP >= 1 then _infoString = $"{_infoString}\nShield:{floor(tempHP)}%";

//Draw Info
drawTipBox(_infoString,tipOnTop,_dist);

#endregion