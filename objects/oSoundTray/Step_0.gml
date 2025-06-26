
#region //Input
var _minusVol = keyboard_check_pressed(189);
var _plusVol = keyboard_check_pressed(187);
var _zeroVol = keyboard_check_pressed(ord("0"));

#endregion

#region //Change Volume
if _plusVol
{
	if image_index != 10
	{
		image_index += 1;
		audio_play_sound(snVolUp, 1, false);
	} else
	{    
        audio_play_sound(snDeny, 1, false);
		shake += 8;
	}
}

if _minusVol
{
	audio_play_sound(snVolDown, 1, false);
	if image_index != 0
	{
		image_index -= 1;
	}
}

if _zeroVol
{
	audio_play_sound(snVolUp, 1, false);
	
	if image_index != 0
	{
		savedVol = image_index;
		image_index = 0;
	} else image_index = savedVol;
}

#endregion

#region //Change Image
global.masterVol = image_index;
depth = -999;

#endregion

#region //Smooth

if _minusVol or _plusVol or _zeroVol
{
	alarm[0] = timerReset;
	alpha = 1;
	yPos = 0;
}

//Stop Shake
shake = lerp(shake,0,.2);

//Slide in
y = lerp(y,yPos,.2);

//Alpha
image_alpha = lerp(image_alpha,alpha,.3);

#endregion
