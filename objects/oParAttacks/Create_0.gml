//Visual
flipSprite = false; //If The Sprite Should Flip Based on The Target
flipBackwards = false; //If it should flip the sprite backwards so targeting enemy is -1 and not 1 (MUST HAVE FLIP SPRITE ENABLED)
posBasedOnCard = false; //If The Attack Offset is Diffrent Based on The Target
newYPos = [card.bbox_top,card.bbox_bottom]; //[targetEnemy,targetPlayer];

//Stats
hitOthers = false; //If It Should Damage Cards
currentlyDamaging = false; //If Currrently Damaging
isCombo = false; //If the attack is a combo
ignoreShield = false; //If the attack should ignore the targets shield

#region Functions DONT CHANGE

/// @desc Returns the card the attack is harming
/// @returns {oAttackCard} The card
getCard = function()
{
    return instance_place(x,y,[oAttackCard,oTestCard]);
}

hurtEffect = function(_x = x,_y = y,_starAmount = 5,_stars = true)
{
    //Get Card
    var _card = getCard();
    
    if !_card
    {
        //Number Effect
        effectNumber(_x,_y,-_value);
        
        //Stars
        if _stars then effectStar(_x,_y,_starAmount,false,20,25);
    }
    
    //Card Effect
    with _card {cardHurt(other.value,_stars);}
}

damageTarget = function(_value = value)
{
	//Status
	currentlyDamaging = true;
	
	//Damage
    if targetEnemy
    {
        hurtEnemy(_value,ignoreShield,!isCombo);
    } else hurtPlayer(_value,ignoreShield,!isCombo);
}

moveToDir = function(_speed = 13,_setAngle = true,_dir = undefined)
{	
	//Get Direction
	if _dir == undefined
	{
		if targetEnemy then _dir = 90; else _dir = -90;
	}
	
	//Set Direction
	direction = _dir;
	
	//Set Angle
	if _setAngle
	{
		image_angle = direction;
	}

	//Move Towards Direction
	speed = _speed;
}


#endregion


//Change This One
action = function()
{
    hurtEffect();
    damageTarget();
}

//Happens When The Attack Is Reflected
reflected = function()
{
	
}


//Apply Options
alarm[0] = 1;