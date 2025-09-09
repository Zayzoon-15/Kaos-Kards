//Inherit Event
event_inherited();


//Set Visuals
flipSprite = false;
posBasedOnCard = true;

//Stats
hitOthers = true;

//Move
moveToDir(13);

//Card Juice
card.cardJuice(false);

//Reduce Value
value *= .4;

//Create More Bread
if breadId < 3
{
    alarm[1] = 15;
}

action = function()
{
    //Damage
    damageTarget();
    hurtEffect(x,y);
    
    //Bread Hit Effect
    instance_create_layer(x,y,"Effects",oBreadHitEffect,{
       image_angle : image_angle 
    });
    
    //Destroy
    instance_destroy();
}

//Trail
alarm[2] = 1;
