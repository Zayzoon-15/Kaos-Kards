//Get Values
var _hp = target == "Player" ? global.playerHp : global.enemyHp;
var _tempHp = target == "Player" ? global.playerTempHp : global.enemyTempHp;
targetMap = target == "Player" ? playerEffects : enemyEffects;
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
if global.showPercentage
{
    tipBoxString = $"{_string}\nHealth: {floor((_hp/maxHp)*100)}%";
    
    var _array = ds_map_keys_to_array(targetMap);
    for (var i = 0; i < array_length(_array); i++) {
        var _effect = targetMap[? _array[i]];
    	var _value = struct_exists(_effect,"showValue") ? (_effect.showValue/100)*100 : 0;
        if _value > 0
        {
            tipBoxString += $"\n{_effect.name}: {round(_value)}%";
        }
    }
    
} else { //Non Percentage
    
    tipBoxString = $"{_string}\nHealth: {floor(_hp)}/{maxHp}";
    
    var _array = ds_map_keys_to_array(targetMap);
    for (var i = 0; i < array_length(_array); i++) {
        var _effect = targetMap[? _array[i]];
    	var _value = struct_exists(_effect,"showValue") ? _effect.showValue : 0;
        if _value > 0
        {
            tipBoxString += $"\n{_effect.name}: {round(_value)}";
        }
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
