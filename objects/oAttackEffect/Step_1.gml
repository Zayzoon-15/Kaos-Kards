//Get Target Health Bar
targetHealthBar = noone;
with (oHealthBar) {
	if (target == "Enemy" and other.targetEnemy) or (target == "Player" and !other.targetEnemy)
    {
        other.targetHealthBar = self.id;
    }
}

//Move Position
if targetHealthBar != noone
{
    var _xOffset = 10;
    x = targetHealthBar.flipped ? targetHealthBar.bbox_left - _xOffset : targetHealthBar.bbox_right + _xOffset;
    y = cardHandMush(ds_map_size(mapId),iconId,targetHealthBar.y+5,55);
}

//Reduce HitStun
if hitStun > 0 then hitStun --;

//Decrease Attack Value
if hitStun <= 0 and info.type == EFFECT_TYPE.HARM then effectValue = lerp(effectValue,-1,.02);

//Show Value
showValue = lerp(showValue,effectValue,.2);

//Update Info
mapId[? info.name] = structMerge(info,{
    value : effectValue,
    effectDone : effectDone,
    timesUsed : timesUsed,
    hitStun : hitStun,
    showValue : clamp(showValue,0,100)
},false);

//Debug
ds_debug_print(mapId,ds_type_map);

//Destroy
if effectDone and effectValue <= 0
{
    instance_destroy();
}