//Inherit the parent event
event_inherited();

//Text
text = "Roll";
infoText = "Press to roll the dice";

//Set Hover 
canHover = true;

//Set Action
action = function () {
    
    //Roll Dice
    with oDice {rollDice();}
    
    //Don't Hover
    canHover = false;
}
