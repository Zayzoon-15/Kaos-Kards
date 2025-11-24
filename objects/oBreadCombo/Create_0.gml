//Inherit
event_inherited();

//Visual
flipSprite = true;
posBasedOnCard = true;
newYPos = [card.bbox_top,card.bbox_bottom];

//Stats
hitOthers = true;
currentlyDamaging = true;
isCombo = true;

//Shake
with oAttackCard
{
	shake = 15;
	cardSetShake(0,.06);
}
card.shake = 40;

//Move
moveToDir(4,false);

//Action
action = function()
{
    //Damage
    damageTarget();
    hurtEffect(x,y,25);
    
    //Destroy
    instance_destroy();
	
	//Finish Combo
	timeSourceCreate(1,comboAttackDone);
}