var _specialKeys = keyboard_check_pressed(vk_alt) or keyboard_check_pressed(vk_f11) or keyboard_check_pressed(189) or keyboard_check_pressed(187) or keyboard_check_pressed(ord("0"));

//Check Keyboard
if keyboard_check_pressed(vk_anykey) and !_specialKeys
{
    if !keyPressed
    {
        keyPressed = true;
        mousePressed = false;
        alarm[0] = 60;
    } else skipIntro();
    
}

//Check Mouse
if mouse_check_button_pressed(mb_any)
{
    if !mousePressed
    {
        mousePressed = true;
        keyPressed = false;
        alarm[0] = 60;
    } else skipIntro();
    
}

if keyPressed
{
    text = "Press Any Key To Skip";
}

if mousePressed
{
    text = "Click Anywhere To Skip";
}