//Get Values
var _hp = target == "Player" ? global.playerHp : global.enemyHp;
var _tempHp = target == "Player" ? global.playerTempHp : global.enemyTempHp;
targetList = target == "Player" ? playerEffects : enemyEffects;
maxHp = target == "Player" ? global.playerMaxHp : global.enemyMaxHp;

//Set Values
hp = lerp(hp,_hp,.2);
tempHp = lerp(tempHp,_tempHp,.2);

//Lerp Angle
angle = lerp(angle,0,.2);

#region Info Box

//Local Vars
var _string = target == "Player" ? "Your Health Bar" : "Enemies Health Bar";
var _dist = tipOnTop ? 5 : 9;

//String
//tipBoxString = $"{_string}\nHealth:{floor((_hp/maxHp)*100)}%"; OLD PERCENTAGE BASED
tipBoxString = $"{_string}\nHealth:{floor(_hp)}/{maxHp}";
for (var i = 0; i < ds_list_size(targetList); ++i) {
	var _listValue = ds_list_find_value(targetList,i);
	var _amount = abs(_listValue.value);
	if _amount > 0
	{
		tipBoxString += $"\n{_listValue.info.name}:{round(_listValue.showPercent)}%";
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


//Clamp Stuff
global.playerHp = floor(global.playerHp);
global.playerTempHp = floor(global.playerTempHp);
global.enemyHp = floor(global.enemyHp);
global.enemyTempHp = floor(global.enemyTempHp);
global.playerHp = clamp(global.playerHp,0,global.playerMaxHp);
global.playerTempHp = clamp(global.playerTempHp,0,global.playerMaxHp);
global.enemyHp = clamp(global.enemyHp,0,global.enemyMaxHp);
global.enemyTempHp = clamp(global.enemyTempHp,0,global.enemyMaxHp);
