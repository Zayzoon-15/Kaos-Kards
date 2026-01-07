//Stick To Screen
x = getPosToWindow(true);

//Update Scissor Value
updateScissorValue();

//Get Scroll Distance
var _maxScrollDist = 0;
with oParSettingBtn
{
    if btnId == global.settingsBtnId-1
    {
        _maxScrollDist = ystart - other.scissorStuct.h -10;
    }
}

//Scroll
var _dir = mouse_wheel_down() - mouse_wheel_up();
scroll += _dir*20;
scroll = clamp(scroll,0,_maxScrollDist);


//Update Button Ui
with oParSettingBtn
{
    targetY = -other.scroll;
}