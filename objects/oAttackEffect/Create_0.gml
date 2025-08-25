

applyEffect = function()
{
    var _targetList = playerEffects;
    if targetEnemy then _targetList = enemyEffects;

    for (var i = 0; i < ds_list_size(_targetList); i++) {
        
        var _listValue = ds_list_find_value(_targetList,i);
    	if _listValue.info == effect
        {
            //Add To Value
            _listValue.percent += value;
            
            //Decrease Hp
            if _listValue.info.type == EFFECT_TYPE.HARM
            {
                var _hpCheck = abs(global.playerHp-100)+5;
                var _realCheck = _hpCheck - _listValue.percent;
                
                if targetEnemy then hurtEnemy(value); else hurtPlayer(value);
            }
            
        }
    }

    value *= .7;
    value = floor(value);
    value = clamp(value,1,100);
}

print("SPAWN")

//Start Total Time
if effect.totalTime != undefined
{
    //Get Time
    var _totalTime = effect.totalTime;
    
    //Appy Time
    randomize();
    alarm[1] = random_range(_totalTime[0],_totalTime[1])*60;
}

//Start Effect
alarm[0] = 1;


//Create Icon
var _createIcon = function(_effect)
{
    var _target = "Player";
    if targetEnemy then _target = "Enemy";
    
    var _array = global.playerHpIcons;
    if targetEnemy then _array = global.enemyHpIcons;
    
    array_insert(_array,0,_effect);
    
    instance_create_layer(0,0,"Ui",oHealthIcon,{
        info : _effect,
        target : _target,
        sprite_index : _effect.sprite,
    });
}

if instance_exists(oHealthIcon)
{
    var _create = true;
    with oHealthIcon
    {
        if healthInst == noone then exit;
        
        var _array = global.playerHpIcons;
        if target == "Enemy" then _array = global.enemyHpIcons;
        
        iconId ++;
        iconId = clamp(iconId,0,array_length(_array));
        
        if info == other.effect{
            iconId = 0;
            _create = false;
        }
    }
    
    if _create then _createIcon(effect);
    
} else _createIcon(effect);