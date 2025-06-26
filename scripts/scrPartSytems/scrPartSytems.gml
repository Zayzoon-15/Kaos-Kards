

function partFireEffect(_x,_y,_xOffset,_yOffset,_time = undefined,_follow = true,_parent = self,)
{
    if !instance_exists(oPartSystemFire)
    {
        instance_create_layer(0,0,"Effects",oPartSystemFire);
    }
    
    instance_create_layer(_x,_y,"Effects",oFireFx,{
        time : _time,
        parent : _parent,
        follow : _follow,
        xOffset : _xOffset,
        yOffset : _yOffset,
    });
}