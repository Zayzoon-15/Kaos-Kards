// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Image
image_alpha = 0;
alphaTime = .03;
scaleTime = .5;

//Info
infoText = global.currentTourney == undefined ? "Press to return to the menu" : "Press to go to break room";
text = global.currentTourney == undefined ? "Exit" : "Continue";

//Action
action = function()
{
    //Leave Game
    if global.currentTourney == undefined
    {
    	transStart(rTournies);
    	timeSourceCreate(.3,gameReset,[true]);
    } else {
        transStart(rTourneyBreak);
    	timeSourceCreate(.3,gameReset,[false]);
        global.tourneyEnemiesBeaten ++;
    }
}