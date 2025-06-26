///@desc Delete

with oKaosManager
{
    alarm[4] = 30;
}

playerChaosCard = undefined;

//Audio
var _sound = asset_get_index($"snStars{irandom_range(1,2)}");
audio_play_sound(_sound,0,false);

starEffect(x,y,10,-50,50,80,-80);

instance_destroy();