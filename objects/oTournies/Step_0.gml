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
	boxY = lerp(boxY,-10,.2);
	shadowY = lerp(shadowY,8,.2);
} else {
	boxY = lerp(boxY,0,.2);
	shadowY = lerp(shadowY,5,.2);
}

//Ease
xscale = lerp(xscale,1,.2);
yscale = lerp(yscale,1,.2);