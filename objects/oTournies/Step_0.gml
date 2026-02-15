//Set Selected
if selected
{
	//Set Selection
	global.currentEnemy = info;
	
	//Change Animation
	changeAnim("win");
} else changeAnim("idle");



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

//Not Shown
if !layer_get_visible(layer)
{
    selected = false;
    canHover = false;
} else canHover = true;

//Animate
if currentAnim != undefined
{
    //Update Frame
    frame += sprite_get_speed(sprite_index) / 60;
    
    //Animate
    if frame >= currentAnim.length
    {
        animationEnd = true;
    
        if currentAnim.loop
        {
            frame -= currentAnim.length;
        } else frame = currentAnim.length - 1;
    }
    
    //Apply Frame
    image_index = currentAnim.start + frame;  
}