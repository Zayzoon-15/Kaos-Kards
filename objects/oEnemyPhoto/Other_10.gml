///@desc Custom Animation End

//Get String
var _string = "";
var _array = struct_get_names(animInfo);
for (var i = 0; i < array_length(_array); i++) {
	if struct_get(animInfo,_array[i]) == currentAnim
    {
        _string = _array[i];
    }
}



//Hotdog Reset
if _string == "kaosHotDogStart"
{
    enemyPlayAnim("idle");
}