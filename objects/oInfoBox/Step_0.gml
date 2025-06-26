

//Goto Parent
x = parent.x;
y = lerp(y,parent.bbox_top-60,.2);

//Destroy
if !touchingMouse(parent) or mouse_check_button(mb_left)
{
    instance_destroy();
}

//Depth
depth = parent.depth - 5;