///@desc Custom Animation End

//Get Animation
var _array = struct_get_names(animInfo);
for (var i = 0; i < array_length(_array); i++) {
    
    //Get Struct
    var _struct = struct_get(animInfo,_array[i]);
    
    //Play Animatiopn
	if _struct == currentAnim and !_struct.loop and _struct.resetAnim != ""
    {
        enemyPlayAnim(_struct.resetAnim);
    }
}