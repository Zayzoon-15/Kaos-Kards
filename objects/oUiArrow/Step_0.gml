
//Can Press
if !global.midTrans {canPress = true;} else canPress = false;


//Hover
if touchingMouse() and canPress
{
    scale = 1.2;
    image_alpha = lerp(image_alpha,1,.2);
} else
{
    scale = 1;
    image_alpha = lerp(image_alpha,.6,.2);
} 


//Ease
xscale = lerp(xscale,scale,.2);
yscale = lerp(yscale,scale,.2);