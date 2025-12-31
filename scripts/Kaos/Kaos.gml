/////////////////////////
///// KAOS ACTIONS /////
///////////////////////

//This is where all koas card attacks go

/* HOW TO
 * All functions should look like this
 * function kaosActionTemp(_targetEnemy)
 * All actions have to call kaosCardDone to show that they are done
 * MAKE SURE ALL KAOS ACTIONS HAVE A WAY TO CALL KaosCardDone TO FINISH THE ACTION
*/



///@self oAttackCard
function kaosActionSwoop(_targetEnemy)
{
	//Create Bread Attack
	instance_create_layer(x,y-150,"Attacks",oSwoopChoose);
	
	//Juice
	cardJuice(true);
    
    //Finish
    timeSourceCreate(4,kaosCardDone);
}

///@self oAttackCard
function kaosActionSwap(_targetEnemy)
{
	//Show Message
	createAlertMessage("All Cards Swapped");
	
	//Juice
    randomize();
    angle += 360 * choose(-1,1);
    cardJuice(true,false,false);
	
	#region Swap Cards
	
	//Get Actions
	var _playersActs = playerActions;
	var _enemyActs = enemyActions;
	
	//Change Actions
	playerActions = _enemyActs;
	enemyActions = _playersActs;
	
	#endregion
    
    //Finish
    timeSourceCreate(5,kaosCardDone);
}

///@self oAttackCard
function kaosActionHigh(_targetEnemy)
{
	//Show Message
	createAlertMessage("All Values Doubled");
	
	//Juice
	cardJuice(true,true);
	
	//Double Values
	global.valueMult *= 2;
    
    //Finish
    timeSourceCreate(2,kaosCardDone);
}

///@self oAttackCard
function kaosActionDestroy(_targetEnemy)
{
	//Juice
	cardJuice(false);
	
	//Take From Someone
	instance_create_layer(0,0,"Attacks",oDestroyedCard,{
		targetEnemy : _targetEnemy
	});
    
    //Finish
    timeSourceCreate(3,kaosCardDone);
}

///@self oAttackCard
function kaosActionFreeze(_targetEnemy)
{	
    //Show Message
	createAlertMessage("Slots Frozen For Next Round");
	
	//Sound
	audioPlaySfx(snFreeze);
    
    //Juice
    cardJuice();
    
    //Get Array
    var _array = _targetEnemy ? global.disabledSlots.enemy : global.disabledSlots.player;
    
    //Get Target Slot
    randomise();
    var _slot = irandom_range(1,3); //1-3 for only action slots
    //Make Sure Same Numbers Dont Repeat
    while _array[_slot]
    {
        _slot = irandom_range(1,3);
    }
    
    //Disable Slot
    _array[_slot] = true; 
    
    //Finish
    timeSourceCreate(2,kaosCardDone);
}

///@self oAttackCard
function kaosActionRps(_targetEnemy)
{
	//Create Text
	instance_create_layer(0,0,"Attacks",oRpsText);
	
	//Create Choices
	var _offset = sprite_get_width(sRpsChoice) * 2;
	for (var i = 0; i < 3; ++i) {	
	    instance_create_layer(ROOM_CENTER.x + (_offset*(i-1)),ROOM_CENTER.y,"Attacks",oRpsChoice,{
			choiceId : i
		});
	}
	
	//Star Sound
	audioPlaySfx([snStars1,snStars2]);
	
	//Destroy Card
	instance_destroy();
}

///@self oAttackCard
function kaosActionBrawl(_targetEnemy)
{
	//Create Map
	instance_create_layer(x,bbox_top+45,"Effects",oBrawlSetup);
	
	//Change Pos
	targetY += 50;
}