//Inherit
event_inherited();

//Position
stickToScreen = true;
stickToScreenRight = room == rDeckBuilder2;

//Action
action = function()
{
    //Transition
    with oDeckBuilder
    {
        startTrans();
    }
    
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    canPress = !instance_exists(oDBCardTrans);
}