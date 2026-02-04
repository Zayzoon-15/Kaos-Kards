//Inherit
event_inherited();

//Set Checked
if is_method(checkedFunc)
{
    checked = checkedFunc();
}

//Ease
checkXScale = lerp_dt(checkXScale,1,.2);
checkYScale = lerp_dt(checkYScale,1,.2);

if checked
{
	sprite_index = sSettingsCheckOn;
} else sprite_index = sSettingsCheckOff;