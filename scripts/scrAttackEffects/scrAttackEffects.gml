/////////////////////////
//// ATTACK EFFECTS ////
///////////////////////




function createAttackEffect(_name,_sprite,_color,_type,_totalTime = undefined,_timeBetween = undefined) constructor 
{
    name = _name;
    sprite = _sprite;
    color = _color;
    type = _type;
    totalTime = _totalTime;
    timeBetween = _timeBetween;
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
    var _struct = {info:_effect,value:_value,percent:_startValue,showPercent:2};
    
    //Replace If Value Exists
    for (var i = 0; i < ds_list_size(_targetList); i++) {
    	if ds_list_find_value(_targetList,i).info == _struct.info
        {
            _struct = ds_list_find_value(_targetList,i);
            _struct.value += _value;
            _struct.percent += _value;
            ds_list_delete(_targetList,i);
            ds_list_insert(_targetList,i,_struct);
            instance_create_depth(0,0,0,oAttackEffect,{
                effect : _effect,
                value : _value,
                targetEnemy : _targetEnemy
            });
            
            exit;
        }
    }
    
    //Add To List
    ds_list_insert(_targetList,0,_struct);
    
    //Create Object To Do Effect
    instance_create_depth(0,0,0,oAttackEffect,{
        effect : _effect,
        value : _value,
        targetEnemy : _targetEnemy
    });

}


function deceraseAllEffects(_amount,_targetEnemy)
{
    var _targetList = playerEffects;
    if _targetEnemy then _targetList = enemyEffects;
    
    for (var i = 0; i < ds_list_size(_targetList); i++) {
        var _struct = ds_list_find_value(_targetList,i);
        _struct.percent -= _amount;
        
        if _struct.info.type == EFFECT_TYPE.HARM
        {
            if _targetEnemy
            {
                if global.enemyTempHp <= 0
                {
                    global.enemyHp += _amount;
                }
            } else if global.playerTempHp <= 0
            {
                global.playerHp += _amount;
            } 
                
        }
        
        ds_list_replace(_targetList,i,_struct);
    }
    
}
