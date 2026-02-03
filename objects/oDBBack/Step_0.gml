//Can Press
if touchingMouse() and !instance_exists(oDBSort) and !global.midTrans
{
    canPress = true;
    image_speed = 1;
} else {
    canPress = false;
    pressed = false;
    image_speed = 0;
}