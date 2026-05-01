//Input
if keyboard_check_pressed(vk_space)
{
    if currentText == startingText
    {
        currentText = "";
    }
    
    keyboard_string = currentText;
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

//Ease Speed
if keyboard_check(vk_up) {
    songSpeed = lerp(songSpeed,4,.05);
} else if keyboard_check(vk_down){
    songSpeed = lerp(songSpeed,0.003906,.05);
} else songSpeed = lerp(songSpeed,1,.2);

//Set Speed
if audio_is_playing(global.curSongAudio)
{
    audio_sound_pitch(global.curSongAudio,songSpeed);
}
