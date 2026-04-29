/////////////////////////
//// ATTACK EFFECTS ////
///////////////////////


///@desc Creates an attack effect
/// @param {string} _name The name of the effect
/// @param {Asset.GMSprite} _sprite The icon of the effect
/// @param {Constant.Color} _color The effect color
/// @param {real} _type The type of effect (Assist or Harm)
/// @param {array<real>} [_timeBetween] The time it takes for the effect to apply
/// @param {array<real>} [_totalTime] The total time the effect takes to disappear
/// @param {bool} [_ignoreShield] If the effect should ignore shields
/// @param {bool} [_shieldCounters] if the effect can't work when a shield is active
function createAttackEffect(_name,_sprite,_color,_type,_timeBetween = undefined,_totalTime = undefined,_ignoreShield = false,_shieldCounters = false) constructor 
{
    name = _name;
    sprite = _sprite;
    color = _color;
    type = _type;
    timeBetween = _timeBetween;
	totalTime = _totalTime;
    ignoreShield = _ignoreShield;
    shieldCounter = _shieldCounters
}



/// @desc Applies an effect to the player or enemy
/// @param {struct.createattackeffect} [_effect] The effect to use
/// @param {real} [_value] The effects strength
/// @param {bool} [_targetEnemy] If it should attack the enemy
function attackEffectAdd(_effect = effectInfo.fire,_value = 1,_targetEnemy = true)
{
    //Get Target Map
    var _map = _targetEnemy ? enemyEffects : playerEffects;
    
    //Check If Effect Already Exists
    if ds_map_exists(_map,_effect.name)
    {
        with (oAttackEffect) {
        	if info == _effect and targetEnemy == _targetEnemy
            {
                //Change Icon Id
                iconId = 0;
                
                //Add Value
				if info.totalTime == undefined 
				{
					value = _value;
				} else value += _value;
                
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


/// @desc Reduces an effect
/// @param {struct.createattackeffect} [_targetEffect] The effect to reduce (If Nan it targets all effects)
/// @param {real} [_amount] The amount to reduce it by
/// @param {bool} [_targetEnemy] If it should target the enemy
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
					effectValue = global.enemyTempHp;
					value = global.enemyTempHp;
                } else {
					global.playerTempHp -= _amount;
					effectValue = global.playerTempHp;
					value = global.playerTempHp;
				}
            }
        }
    }
}


