//Touching Mouse
if touchingMouse() and canClick
{
	targetScale = 1.2;
} else { //Not Touching
	
	//Reset Scale
	targetScale = 1;
	
	//Mouse Left
	pressed = false;	
}

//Shrink
if !canClick then targetScale = 0;

//Fade
var _alpha = canClick ? 1 : 0;
image_alpha = lerp_dt(image_alpha,_alpha,.3);

//Ease Values
xscale = lerp_dt(xscale,targetScale,.3);
yscale = lerp_dt(yscale,targetScale,.3);