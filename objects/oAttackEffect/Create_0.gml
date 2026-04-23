//Get Id
mapId = targetEnemy ? enemyEffects : playerEffects;

//Nerf Value
value = info.totalTime == undefined ? value : ceil(value/3);

//Useful Vars
effectValue = 0;
showValue = 0;
effectDone = false;
timesUsed = 0;
hitStun = 0;

//Change Sprite
sprite_index = info.sprite;

//Change Other Icon Ids
with oAttackEffect
{
    if self.id != other.id
    {
        iconId ++;
    }
}

//Icon
iconId = 0;
targetHealthBar = noone;

//Start Effect
alarm[0] = 1;

//Destroy Effect
alarm[1] = info.totalTime == undefined ? 2 : random_range(info.totalTime[0],info.totalTime[1])*60;

////Add Effect
//ds_map_add(mapId,info.name,structMerge(info, {
    //value : value,
    //effectDone : false,
    //timesUsed : 0,
    //hitStun : 0,
    //showValue : value,
//},false));

//DEBUG
ds_debug_print(mapId,ds_type_map);