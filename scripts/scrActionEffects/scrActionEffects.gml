

function addEffect(_target,_value,_effectTime = 60)
{
    var _inst = instance_create_layer(0,0,"Effects",oAttackEffects,{
        target : _target,
        value : _value,
        effectTime : _effectTime
    });
}