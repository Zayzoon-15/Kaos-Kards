///@desc End Hotdog Action

//Destroy Guys
with oHotdogGuy
{
    effectStar(x,y,5,false);
    instance_destroy();
}

//End Action
kaosCardDone();

//Destroy Self
instance_destroy();