
//Visual
flipSprite = false;
posBasedOnCard = false;
newYPos = [card.bbox_top,card.bbox_bottom]; //[targetEnemy,targetPlayer];

//Functions DONT CHANGE
hurtEffect = function(_x = x,_y = y)
{
    //Get Card
    var _card = instance_place(x,y,oAttackCard);
    
    if !_card
    {
        //Number Effect
        numberEffect(_x,_y,-value);
        
        //Stars
        var _starX = (sprite_width/2)-20;
        var _starY = (sprite_height/2)-25;
        starEffect(_x,_y,5,-_starX,_starX,-_starY,_starY);
    }
    
    //Card Effect
    with _card {cardHurt(other.value);}
}

damageTarget = function()
{
    if targetEnemy
    {
        hurtEnemy(value);
    } else hurtPlayer(value);
}

//Change This One
action = function()
{
    hurtEffect();
    damageTarget();
}

//Apply Options
alarm[0] = 1;