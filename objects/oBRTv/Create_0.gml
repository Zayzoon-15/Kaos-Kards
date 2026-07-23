//Inherit
event_inherited();

//Enteractions
createBubbleOnClick = true;
targetHoldTime = 30;
bubbleText = "I dont feel like playing right now.";

//Info
tipBoxString = "A Tv";
tipBoxOffset = new Vector2(-5,0);

//Action
action = function()
{
    if holdTime >= targetHoldTime-2
    {
        //Choose A Game
        
        
    } else createBubble(bubbleText);
}