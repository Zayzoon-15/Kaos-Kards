//Inherit
event_inherited();

//Set Position
x = ROOM_CENTER.x;
y = SCREEN_HEIGHT - 25;

//Box Setup
heightMargin = 5;
widthMargin = 5;
maxWidth = 600;

//Image
textScale = 2;

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