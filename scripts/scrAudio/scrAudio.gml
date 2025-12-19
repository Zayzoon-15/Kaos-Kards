//Functions that have to do with audio


///@desc Plays a sound effect
///The pitch of this sound can be changed
///@param {Asset.GMSound} _sound The sound asset (Can be an array of sounds)
///@param {real} [_low] The lowest the pitch can be (Default = 1)
///@param {real} [_high] The highest the pitch can be (Default = 1)
///@param {real} _x The x position to play the sound (Default = x)
///@param {real} _y The y position to play the sound (Default = y)
function audioPlaySfx(_sound,_low = 1,_high = 1,_x = x,_y = y)
{
    //Get Pitch
    randomise();
    var _pitch = random_range(_low,_high);
    
    //Get Sound Asset
    var _asset = _sound;
    if is_array(_sound)
    {
        _asset = array_get_random(_sound);
    }
    
    //Play Sound
    audio_play_sound(_asset,0,false,1,0,_pitch);
    //audio_play_sound_at(_asset, _x, _y, 0, 1500, 100, 1, false, 0,  1,0,_pitch);
}
