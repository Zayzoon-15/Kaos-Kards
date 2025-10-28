//Get Text Size
height = string_height_ext(text,-1,maxWidth);
width = string_width_ext(text,-1,maxWidth);
var _nameWidth = string_width_ext(name,-1,maxWidth)*2;

if _nameWidth > width
{
    width = _nameWidth;
}

//Fade Text
textAlpha = lerp(textAlpha,1,.2);

//Go To Parent
if instance_exists(parent)
{
    var _yDist = sprite_get_height(sCardBlank)*.6;
    
    x = parent.x;
    y = lerp(y,parent.cardY-_yDist,.2);
	
	//Destory
	if !parent.hover or !parent.canGrab
	{
	    instance_destroy();
	}
} else instance_destroy();

//Depth
depth = -5;


////Keep In Room
//x = clamp(x,width*.6,room_width-(width*.6));
//y = clamp(y,height,room_height-(height));