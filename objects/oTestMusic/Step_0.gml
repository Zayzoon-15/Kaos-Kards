//Input
if keyboard_check_pressed(vk_space)
{
    keyboard_string = "";
    typing = true;
    typingSong = true;
    if keyboard_check(vk_control)
    {
        typingSong = false;
    }
}

//Type
if typing 
{
    currentText = keyboard_string;
    
    //Clear
    if keyboard_check(vk_control) and keyboard_check_pressed(vk_backspace)
    {
        keyboard_string = "";
    }
}

//Type
if typing 
{
    if typingSong
    {
        currentText = keyboard_string;
    } else currentTextGroup = keyboard_string;
}

//Ease Speed
if keyboard_check(vk_up) {
    songSpeed = lerp_dt(songSpeed,4,.05);
}  else if keyboard_check(vk_down){
    songSpeed = lerp_dt(songSpeed,0.003906,.05);
} else songSpeed = lerp_dt(songSpeed,1,.2);

//Set Speed
audio_sound_pitch(global.curSong,songSpeed);