if mouse_check_button_pressed(mb_left) then pressed = true;

if mouse_check_button_released(mb_left) and pressed
{
    instance_destroy();
}