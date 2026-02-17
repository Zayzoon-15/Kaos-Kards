///@desc Spawn Birds

//Time
var _time = .2;

for (var i = 0; i < 5; i++) {
    
    //Set Stuff
    var _func = function(_targetEnemy)
    {
        instance_create_depth(-10,-10,depth-1,oSwoopBirdAttack,{
            targetEnemy : _targetEnemy,
            value : ceil(value/3)
        })
    }
    
    //Create Time Source
    var _timeSource = time_source_create(time_source_game,_time*i,time_source_units_seconds,_func,[targetEnemy]);
    time_source_start(_timeSource);
}
