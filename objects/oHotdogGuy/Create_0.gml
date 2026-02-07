//Set Position
var _offset = playerId == 0 ? 250 : -250; 
x = ROOM_CENTER.x + _offset;
y = ROOM_CENTER.y + 80;

//Star Effect
effectStar(x,y-sprite_height/2,15,playerId == 0);

//Hotdog
hotdogImage = 0;

//Food
ate = 0;
winner = false;

//Functions

eatFood = function()
{
    //Animate
    if sprite_index != sHotdogGuyEat
    {
        image_index = 0;
        sprite_index = sHotdogGuyEat;
    }
    
    ate ++;
    
    effectNumber(x,y,1);
}

missedFood = function()
{
    //Animate
    if sprite_index != sHotdogGuySad
    {
        image_index = 0;
        sprite_index = sHotdogGuySad;
    }
    
    effectNumber(x,y,-1);
}
    
