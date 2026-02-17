// Inherit the parent event
event_inherited();

//Position
stickToScreen = true;
stickToScreenRight = false;

//Info
infoText = "Press to roll the dice";
text = "Roll";

//Action
action = function()
{
    //Roll Dice
    with oDice
    {
        rollDice();
    }
    
    //Don't Hover
    canHover = false;
}