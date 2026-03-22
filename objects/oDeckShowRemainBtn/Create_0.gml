// Inherit the parent event
event_inherited();

//Button
canHover = true;
isMenuButton = true;

//Info
drawInfo = false;
text = "Remaining";
textXScale = 0;

//Distance
distX = x - oDeckShowMenu.x;
distY = y - oDeckShowMenu.bbox_bottom;

TweenEasyFade(0,1,0,10,EaseOutCubic);

//Action
action = function()
{
    oDeckShowMenu.showPlaced = true;
    
    //Juice
    oDeckShowCards.image_xscale += .1;
    oDeckShowCards.image_yscale += .1;
}