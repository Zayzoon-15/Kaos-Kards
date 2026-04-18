///@desc Remove Effect

//Move Icon
with oAttackEffect
{
    if iconId > other.iconId
    {
        iconId --;
    }
}

//Exit Animation
instance_create_depth(x,y,depth,oHealthIconExit,{
    healthInst : targetHealthBar,
    sprite_index : sprite_index
})

//Delete From Map
ds_map_delete(mapId,info.name);