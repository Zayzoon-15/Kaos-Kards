if target == "Enemy"
{
    instance_create_layer(x,y+50,"Effects",oBreadDestroyed,{
        target : target,
        breadId : breadId
    });
    instance_destroy();
}

if target == "Player"
{
    instance_create_layer(x,y-50,"Effects",oBreadDestroyed,{
        target : target,
        breadId : breadId
    });
    instance_destroy();
}

var _yOffset;

if target == "Enemy"
{
    _yOffset = 50;
} else _yOffset = -50;

numberHitEffect(x,y+_yOffset,value,false);