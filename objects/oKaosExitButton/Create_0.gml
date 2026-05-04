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
text = global.currentTourney == undefined ? "Exit" : "Break Room";

//LAST MATCH
if global.currentTourney != undefined and array_length(global.currentTourney.enemies) <= global.tourneyEnemiesBeaten+1
{
    text = "Exit";
    infoText = "You won now leave"
}

//Quit
if quit
{
    text = "Quit";
    infoText = "Exit to main menu";
}

//Action
action = function()
{
    if quit
    {
        transStart(rTournies);
    	timeSourceCreate(.3,gameReset,[true]);
        
        exit;
    }
    
    //Leave Game
    if global.currentTourney == undefined
    {
    	transStart(rTournies);
    	timeSourceCreate(.3,gameReset,[true]);
    } else {
        global.tourneyEnemiesBeaten ++;
        
        if global.tourneyEnemiesBeaten >= array_length(global.currentTourney.enemies)
        {
            transStart(rTournies);
            timeSourceCreate(.3,gameReset,[true]);
        } else {
            transStart(rBreakRoom);
            timeSourceCreate(.3,gameReset,[false]);
        }
        
    }
}