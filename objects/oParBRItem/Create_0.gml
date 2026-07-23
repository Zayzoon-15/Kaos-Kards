//Mouse
canHover = true;
pressed = false;
holdTime = 0;
targetHoldTime = 0;
holdValue = 0;

//Position
stickToRight = true;

//Enteractions
createBubbleOnClick = false;
bubbleText = "No Text";

//Info
tipBox = true;
tipBoxString = "Item";
tipBoxTop = true;
tipBoxDistance = 10;
tipBoxOffset = new Vector2(0,0);


//Functions
createBubble = function(_string)
{
    if instance_exists(oBRThinkBubble) then exit;
    
    instance_create_layer(0,0,"Ui",oBRThinkBubble,{
        text : _string
    })
}

action = function()
{
    if createBubbleOnClick
    {
        createBubble(bubbleText);
    }
}