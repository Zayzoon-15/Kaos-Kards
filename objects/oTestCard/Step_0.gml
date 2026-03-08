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

if keyboard_check_pressed(vk_left)
{
    global.valueMult += .1;
    print("VAR",global.valueMult);
}