//Inherit
event_inherited();

////Set Target Text Scale
//print(string_width(text)*2,(abs(rectX2 - rectX1)/2)-50)
//if string_width(text)*2 >= (abs(rectX2 - rectX1)/2)-50
//{
    //var _textScale = (string_width(text)*2 - (abs(rectX2 - rectX1)/10))/100;
    //print(_textScale);
    //textTargetScale = _textScale;
//}

//Set Dragging
if dragging and mouse_check_button_released(mb_left)
{
	dragging = false;
}

//Set Slider Box
sliderBoxX1 = x-30;
sliderBoxX2 = rectX1-10;
sliderBoxY1 = y-((height/2)*rectYScale);
sliderBoxY2 = y+((height/2)*rectYScale);
sliderBoxWidth = abs(sliderBoxX2 - sliderBoxX1);

//Drag
if dragging
{
	//No Hover
	canHover = false;
	
	//Change Value
	if mouse_x > sliderBoxX1
	{
        //Get Amount
		var _x = abs(sliderBoxX1-mouse_x);
		var _amount = _x / sliderBoxWidth;
        
        //Set Amount
		currentAmount = _amount*slideMax;
        
        //Round Method
        if roundFunc != undefined
        {
            currentAmount = roundFunc(currentAmount);
        }
        
	} else currentAmount = 0;
	
} else canHover = true;

//Clamp
currentAmount = clamp(currentAmount,slideMin,slideMax);

//Sound
if dragging
{
	if !audio_is_playing(snSettingsHold) then audioPlaySfx(snSettingsHold);
	playSound = true;
	
	//Change Pitch
	var _pitch = (currentAmount/slideMax)+.8;
	audio_sound_pitch(snSettingsHold,_pitch);
	
} else {
	if playSound {
		audio_stop_sound(snSettingsHold);
		playSound = false;
	}
}

//Change Variable
if variable_global_exists(changeVar)
{
	variable_global_set(changeVar,currentAmount);
}