//No Subtitles
if !global.voiceover
{
    audio_stop_sound(info.sound);
    instance_destroy();
}

//Set Text Array
if is_array(info.text)
{
    text = info.text[arrayId];
}