///@desc Hover Sound

if state != CARDSTATE.GRABBED and !global.holdingCard and canGrab
{
    audio_play_sound(snCardHover,0,false);
}
