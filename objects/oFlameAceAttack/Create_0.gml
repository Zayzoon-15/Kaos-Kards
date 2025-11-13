//Inherit
event_inherited();

//Set Visuals
flipSprite = false;
posBasedOnCard = true;

//Stats
hitOthers = true;
currentlyDamaging = true;
value *= .7;

//Move
moveToDir(13);

//Set Size
setSize(.7,.7);

//Action
action = function()
{
    //Damage
    damageTarget();
    hurtEffect(x,y);
    
    //Effects
	addEffect(attackEffects.fire,value*.6,targetEnemy);
	
    //Destroy
    instance_destroy();
}