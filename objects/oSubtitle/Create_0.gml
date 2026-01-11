//Inherit
event_inherited();

//Set Position
x = ROOM_CENTER.x;
y = SCREEN_HEIGHT - 25;

//Box Setup
heightMargin = 5;
widthMargin = 10;
maxWidth = 600;

//Box Style
outlineWidth = 0;
boxAlpha = global.subtitlesStyle.boxAlpha;

//Image
textScale = 1;
targetFont = fnSubtitle;
smoothText = true;

//Give Font Outline
font_enable_effects(fnSubtitle, true, { 
    outlineEnable: global.subtitlesStyle.outlineThickness > 0, 
    outlineDistance: global.subtitlesStyle.outlineThickness,
    outlineColour: c_black
});

//Array Id
arrayId = 0;

//Set Text
text = is_array(info.text) ? "" : info.text;

//Pause
sound = info.sound;
paused = false;

//Time Sources
timeSources = [];

//Change Text
for (var i = 0; i < array_length(info.textTime); i++) {
    
    //Create Timer
	var _timeSource = timeSourceCreate(info.textTime[i],function(_index)
    {
        arrayId = _index;
    },[i]);
    
    //Add To Array
    array_push(timeSources,_timeSource);
}

//No Subtitles
if !global.voiceover
{
    audio_stop_sound(info.sound);
    instance_destroy();
}