// Inherit the parent event
event_inherited();

//Info
infoText = "Press to roll the dice";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Roll";

//Action
action = function()
{
    with oDice
    {
        rollDice();
    }
    
    canHover = false;
}