/////////////////////////
//// ATTACK EFFECTS ////
///////////////////////




function createAttackEffect(_name,_sprite,_color,_type,_timeBetween = undefined,_totalTime = undefined) constructor 
{
    name = _name;
    sprite = _sprite;
    color = _color;
    type = _type;
    timeBetween = _timeBetween;
	totalTime = _totalTime;
}




function addEffect(_effect,_value,_targetEnemy=false)
{
    //Get Target
    var _targetList = playerEffects;
    if _targetEnemy then _targetList = enemyEffects;
	
    
    //Get Starting Value
    var _startValue = _value;
    if _effect.totalTime != undefined then _startValue = 2;
    
    //Create Struct
    var _struct = {info:_effect,value:0,percent:0,showPercent:0,healthInst:noone};
    
    //Replace If Value Exists
    for (var i = 0; i < ds_list_size(_targetList); i++) {
    	if ds_list_find_value(_targetList,i).info == _struct.info
        {
            _struct = ds_list_find_value(_targetList,i);

            with oAttackEffect
            {
                if effect == _struct.info
                {
					//Set Time
					setupTime();
					
					//Set Value
                    value = _value;
					
					//Effect
                    applyEffect();
                }
            }
            
            ds_list_delete(_targetList,i);
            ds_list_insert(_targetList,i,_struct);
            
            exit;
        }
    }
    
    //Add To List
    ds_list_insert(_targetList,0,_struct);
    
    //Create Object To Do Effect
    instance_create_depth(0,0,0,oAttackEffect,{
        effect : _effect,
        value : _value,
        targetEnemy : _targetEnemy,
		info : _effect
    });

}


function reduceAssEffects(_amount,_targetEnemy)
{
    var _targetList = playerEffects;
    if _targetEnemy then _targetList = enemyEffects;
    
    for (var i = 0; i < ds_list_size(_targetList); i++) {
        var _struct = ds_list_find_value(_targetList,i);
        _struct.value -= _amount;
        
        if _struct.info.type == EFFECT_TYPE.ASS
        {
            if _targetEnemy
            {
				global.enemyTempHp -= _amount;
            } else
            {
                global.enemyTempHp -= _amount;
            } 
                
        }
        
        ds_list_replace(_targetList,i,_struct);
    }
    
}