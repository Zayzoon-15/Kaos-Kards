///@desc Hover Sound
if canPress and !locked and !global.showCards
{
    var _sound = asset_get_index($"snButtonHover{irandom_range(1,2)}");
    audio_play_sound(_sound,0,false);
}
