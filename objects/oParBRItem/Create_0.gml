//Mouse
pressed = false;



//Enteractions
createBubbleOnClick = false;
bubbleText = "No Text";


//Functions
createBubble = function(_string)
{
    if instance_exists(oBRThinkBubble) then exit;
    
    instance_create_layer(0,0,"Ui",oBRThinkBubble,{
        text : _string
    })
}