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
    if typingSong
    {
        currentText = keyboard_string;
    } else currentTextGroup = keyboard_string;
}

//Ease Speed
if keyboard_check(vk_up) {
    songSpeed = lerp(songSpeed,4,.05);
}  else if keyboard_check(vk_down){
    songSpeed = lerp(songSpeed,0.003906,.05);
} else songSpeed = lerp(songSpeed,1,.2);

//Set Speed
audio_sound_pitch(global.curSong,songSpeed);