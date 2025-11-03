//Inherit the parent event
event_inherited();

//Visual
flipSprite = true;

//Stats
currentlyDamaging = false;

//Functions
action = function()
{
    //Set Right Pos
    var _y;
    if targetEnemy then _y = bbox_top+50; else _y = bbox_bottom-50;
    
    //Functions
    hurtEffect(x,_y);
    damageTarget();
}