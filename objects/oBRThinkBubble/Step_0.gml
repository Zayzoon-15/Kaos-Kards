if mouse_check_button_pressed(mb_left)
{
    pressed = true;
}

if mouse_check_button_released(mb_left) and pressed
{
    if textShow > string_length(text)
    {
        TweenEasyFade(1,0,0,20,EaseInCubic);
        TweenEasyScale(1,1,.5,.5,0,30,EaseInBack);
        timeSourceCreate(35,instance_destroy,[self],time_source_units_frames);
    } else textShow = string_length(text) + 1;
    
    pressed = false;
}