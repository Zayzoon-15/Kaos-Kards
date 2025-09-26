//Inherit
event_inherited();

//Ease
boxXScale = lerp(boxXScale,1,.2);
boxYScale = lerp(boxYScale,1,.2);

//Click
if struct_exists(info,"disabled")
{
	canClick = info.disabled();
}