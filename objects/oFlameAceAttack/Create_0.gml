//Inherit
event_inherited();

//Set Visuals
flipSprite = false;
posBasedOnCard = true;

//Stats
hitOthers = true;
currentlyDamaging = true;

//Move
moveToDir(13);

//Set Size
setSize(1);

//Sound
audioPlaySfx(snFire1,.95,1.05);

//Action
action = function()
{
    var _effectValue = value*.2;
    value *= .5;
    
    //Damage
    damageTarget();
    hurtEffect(x,y);
    
    //Sound
    audioPlaySfx(snFire2,.95,1.05);
    
    //Effects
	addEffect(attackEffects.fire,_effectValue,targetEnemy);
	
    //Destroy
    instance_destroy();
}