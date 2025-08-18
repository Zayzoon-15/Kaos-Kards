
//Set Time
if info.totalTime != undefined
{
    time = random_range(info.totalTime.min,info.totalTime.max)*60;
    timeBetween = random_range(info.timeBetween.min,info.timeBetween.max)*60;
}


//Function
applyEffect = function()
{
    //Apply Values
    if info.type == EFFECTTYPES.ASS
    {
        if !targetEnemy
        {
            global.playerTempHp += value;
        } else global.enemyTempHp += value;
    } else {
        if !targetEnemy
        {
            global.playerHp -= value;
        } else global.enemyHp -= value;
    }
    
    //Reduce Value
    value *= .6;
    value = clamp(value,1,99);
    
}

function updateArray()
{
    //Get Correct Array
    var _array
    if targetEnemy
    {
        _array = variable_global_get("enemyEffects");
    } else _array = variable_global_get("playerEffects");
    
    //Create Struct
    var _struct = {info : info, value : value};
    
    //Remove Same Value
    var _sameValue = false;
    for (var i = 0; i < array_length(_array); i++) {
    	if _array[i].info == info
        {
            //Set Array
            _array[i] = _struct;
            
            //Same Value
            _sameValue = true;
        }
    }
    
    //Add To Array
    if !_sameValue then array_insert(_array,0,_struct);
    
    //Debug
    print(_array);
}

//Update Array
updateArray();


//Apply Effect
if info.totalTime != undefined
{
    alarm[0] = 1;
    alarm[1] = time;
} else {
	applyEffect();
    instance_destroy();
}


//Create Icon
var _target = "Player";
if targetEnemy then _target = "Enemy";

instance_create_layer(0,0,"Ui",oHealthIcon,{
    info : info,
    target : _target,
    sprite_index : info.sprite
});