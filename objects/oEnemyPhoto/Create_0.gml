//Set Sprite
sprite_index = global.currentEnemy.sprite;

//Animation
animInfo = global.currentEnemy.animInfo;
frame = 0;
currentAnim = 0;
animationEnd = false;
shake = 0;
ignoreTime = 0;
resetAnim = "";
enemyPlayAnim("idle");

//Hover
canHover = true;

//Functions
hurt = function()
{
    //Play Animation
    enemyPlayAnim("hurt");
    shake += 15;
    
    //Start Reset
    alarm[0] = 40;
}

win = function(_stars = true)
{
    //Play Animation
    enemyPlayAnim("win");
    
    //Stars
    if _stars then effectStar(x,y,10,false,10,15);
    
    //Start Reset
    alarm[0] = 40;
}