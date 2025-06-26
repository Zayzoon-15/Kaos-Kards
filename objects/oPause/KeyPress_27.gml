///@desc Pause Game
if canPause
{
    global.gamePaused = !global.gamePaused;
    audio_play_sound(snCardHover,0,false);
}