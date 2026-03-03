//Move To Target Pos
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);

//Set Hover
hover = touchingMouse();

//Card Hover Stuff
if hoverCard
{
    drawCardText(info);
}