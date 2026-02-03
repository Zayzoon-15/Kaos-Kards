//Can Press
if touchingMouse() and !oDeckBuilder.transition and !global.midTrans
{
    canPress = true;
} else {
    canPress = false;
    pressed = false;
}