//Inherit
event_inherited();

//Set Visuals
flipSprite = false;
posBasedOnCard = true;

//Stats
hitOthers = true;
value /= 2;

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
	addEffect(attackEffects.fire,value*.8,targetEnemy);
	
    //Destroy
    instance_destroy();
}