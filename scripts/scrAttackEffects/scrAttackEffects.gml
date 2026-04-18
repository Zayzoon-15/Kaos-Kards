/////////////////////////
//// ATTACK EFFECTS ////
///////////////////////




function createAttackEffect(_name,_sprite,_color,_type,_timeBetween = undefined,_totalTime = undefined,_ignoreShield = false) constructor 
{
    name = _name;
    sprite = _sprite;
    color = _color;
    type = _type;
    timeBetween = _timeBetween;
	totalTime = _totalTime;
    ignoreShield = _ignoreShield;
}


function attackEffectAdd(_effect = effectInfo.fire,_value = 1,_targetEnemy = true)
{
    //Get Target Map
    var _map = _targetEnemy ? enemyEffects : playerEffects;
    
    //Check If Effect Already Exists
    if ds_map_exists(_map,_effect.name)
    {
        with (oAttackEffect) {
        	if info == _effect
            {
                //Change Icon Id
                iconId = 0;
                
                //Add Value
                value += _value;
                
                //Apply Effect Again
                alarm[0] = 1;
                
                //Reset Destroy Time
                alarm[1] = info.totalTime == undefined ? 2 : random_range(info.totalTime[0],info.totalTime[1])*60;
            }
        }
    } else { //Create Effect
    	
        instance_create_depth(0,0,0,oAttackEffect,{ 
            info :  _effect,
            targetEnemy : _targetEnemy,
            value : _value
        });
        
    }
}

function attackEffectReduce(_targetEffect = NaN,_amount = 1,_targetEnemy = false)
{
    with (oAttackEffect) {
        if (_targetEffect == NaN or _targetEffect == info) and targetEnemy == _targetEnemy
        {
        	effectValue -= _amount;
            value -= _amount;
            
            if info.type == EFFECT_TYPE.ASS
            {
                if _targetEnemy
                {
                    global.enemyTempHp -= _amount;
                } else global.playerTempHp -= _amount;
            }
        }
    }
}
