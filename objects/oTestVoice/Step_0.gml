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