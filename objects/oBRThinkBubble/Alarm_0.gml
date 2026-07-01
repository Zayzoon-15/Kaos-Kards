///@desc Create Sound

//Attempt to recreate combo glitched sound for the text bubble


//Stop Tick Sound
audio_stop_sound(snComboTick);

//Play Pitched Down Combo Sound
audioPlaySfx(snComboUsed,1.4,1.6,.2);

//Increase Sounds Played
textSounds ++;

//Loop Alarm
if textSounds < 5
{
    alarm[0] = 1;
}