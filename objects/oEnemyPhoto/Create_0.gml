
recoverTime = 60;

shake = 0;

normalSprite = getEnemySprite().idle;
hurtSprite = getEnemySprite().hurt;
winSprite = getEnemySprite().win;

info = getEnemyInfo();

sprite_index = normalSprite;

hurt = function()
{
    //Set Sprite
    sprite_index = hurtSprite;
    
    //Shake
    shake = 10;
    
    //Reset Sprite
    alarm[0] = recoverTime;
}

win = function()
{
    //Set Sprite
    sprite_index = winSprite;
    
    //Stars
    starEffect(x,y,10,-100,100,-100,100);
    
    //Reset Sprite
    alarm[0] = recoverTime;
}