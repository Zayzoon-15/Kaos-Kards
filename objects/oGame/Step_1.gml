//Start Game
var _loaded = audio_group_is_loaded(agMusic) and audio_group_is_loaded(agSfx) and audio_group_is_loaded(agVoice);
if _loaded and !alarm[0] and room == rSetup
{
    alarm[0] = 1;
}
