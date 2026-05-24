//Move To Target Pos
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);

//Scale
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);

//Angle
image_angle = lerp(image_angle,0,.2);

//Set Hover
hover = touchingMouse();

//Card Hover Stuff
if hoverCard
{
    drawCardText(info);
}
