//No Subtitles
if !global.voiceover
{
    audio_stop_sound(info.sound);
    instance_destroy();
}

//Set Style
boxAlpha = global.subtitlesStyle.boxAlpha;
font_enable_effects(fnSubtitle, true, { 
    outlineEnable: global.subtitlesStyle.outlineThickness > 0, 
    outlineDistance: global.subtitlesStyle.outlineThickness,
    outlineColour: c_black
});

//Set Text Array
if is_array(info.text)
{
    text = info.text[arrayId];
}