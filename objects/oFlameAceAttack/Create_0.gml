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
setSize(1);

//Sound
audioPlaySfx(snFire1,.95,1.05);

//Action
action = function()
{
    //Damage
    damageTarget();
    hurtEffect(x,y);
    
    //Sound
    audioPlaySfx(snFire2,.95,1.05);
    
    //Effects
	addEffect(attackEffects.fire,value*.6,targetEnemy);
	
    //Destroy
    instance_destroy();
}