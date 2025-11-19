
//Set Sprite
sprite_index = global.currentEnemy.sprite;

//Animation
frame = 0;
currentAnim = 0;
animationEnd = false;
shake = 0;

//Hover
canHover = true;

//Functions
hurt = function()
{
    //Set Right Animation
    currentAnim = 1;
    
    //Shake
    shake += 15;
    
    //Start Reset
    alarm[0] = 40;
}

win = function(_stars = true)
{
    //Set Right Animation
    currentAnim = 2;
    
    //Stars
    if _stars
    {
        starEffect(x,y,10,false,10,15);
    }
    
    //Start Reset
    alarm[0] = 40;
}