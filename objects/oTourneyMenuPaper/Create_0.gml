//Rotate
angleVel = 0;
damping = .75;
stiffness = .07;
limit = 80;
mouseDrag = .03;

//Mouse
lastMouseX = x;
touched = false;

//Grab
grabbed = false;
wasGrabbed = false;
canHover = true;


change = function(_info = tourneyInfo.cameos)
{
    sprite_index = _info.sprite;
    image_angle = 35;
}