//Inherit
event_inherited();

//Set Visuals
flipSprite = false;
posBasedOnCard = true;

//Stats
hitOthers = true;
currentlyDamaging = false;
value *= 1.3;

//Move
moveToDir(5);

//Action
damageTarget = function()
{
	//Damage
    if targetEnemy
    {
        hurtEnemy(value,true);
    } else hurtPlayer(value,true);
}

action = function()
{
    //Damage
    damageTarget();
    hurtEffect(x,y);
    
    //Destroy
    instance_destroy();
}