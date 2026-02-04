//Set Animation
spriteLoopFrames(curAnim,4);

//Set Selected
if selected
{
	//Set Selection
	global.currentEnemy = info;
	
	//Change Animation
	curAnim = 2;
} else curAnim = 0;

//Hover
drawTipBox(info.name,true,false,20,1.5);

//Touching Mouse
if touchingMouse()
{
	boxY = lerp_dt(boxY,-10,.2);
	shadowY = lerp_dt(shadowY,8,.2);
} else {
	boxY = lerp_dt(boxY,0,.2);
	shadowY = lerp_dt(shadowY,5,.2);
}

//Ease
xscale = lerp_dt(xscale,1,.2);
yscale = lerp_dt(yscale,1,.2);

//Not Shown
if !layer_get_visible(layer)
{
    selected = false;
    canHover = false;
} else canHover = true;