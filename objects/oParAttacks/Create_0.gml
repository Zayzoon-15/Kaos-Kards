//Visual
flipSprite = false; //If The Sprite Should Flip Based on The Target
posBasedOnCard = false; //If The Attack Offset is Diffrent Based on The Target
newYPos = [card.bbox_top,card.bbox_bottom]; //[targetEnemy,targetPlayer];

//Stats
hitOthers = false; //If It Should Damage Cards
currentlyDamaging = false; //If Currrently Damaging

//Reduce Value
value *= .8;
value = clamp(value,0,99);


#region Functions DONT CHANGE

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
        starEffect(_x,_y,5,20,25);
    }
    
    //Card Effect
    with _card {cardHurt(other.value);}
}

damageTarget = function()
{
	//Status
	currentlyDamaging = true;
	
	//Damage
    if targetEnemy
    {
        hurtEnemy(value);
    } else hurtPlayer(value);
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

//Apply Options
alarm[0] = 1;