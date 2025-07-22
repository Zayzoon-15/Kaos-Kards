
//Set Sprite
sprite_index = global.currentEnemy.sprite;

//Animation
frame = 0;
animation = [0,90,180,360];
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
        var _starsX = (sprite_width/2)-10;
        var _starsY = (sprite_height/2)-15;
        starEffect(x,y,10,-_starsX,_starsX,-_starsY,_starsY);
    }
    
    //Start Reset
    alarm[0] = 40;
}