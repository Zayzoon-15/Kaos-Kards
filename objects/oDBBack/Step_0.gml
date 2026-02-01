if touchingMouse() and !instance_exists(oDBSort) and !global.midTrans
{
    canPress = true;
} else canPress = false;

if canPress
{
    image_speed = 1;
} else {
    image_speed = 0;
}