/////////////////////////
///// KAOS ACTIONS /////
///////////////////////

//This is where all koas card attacks go

/* HOW TO
 * All functions should look like this
 * function kaosActionTemp(_targetEnemy)
 * All actions have to call kaosCardDone to show that they are done
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
    cardJuice(true,false);
	
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
	cardJuice(true);
	
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
	
	//Take From Enemy
	instance_create_layer(0,0,"Attacks",oDestroyedCard,{
		targetEnemy : true
	});
	
	//Take From Player
	instance_create_layer(0,0,"Attacks",oDestroyedCard,{
		targetEnemy : false
	});
    
    //Finish
    timeSourceCreate(5,kaosCardDone);
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
    
    #region Disable Slots
    
    for (var i = 0; i < 2; i++) {
        //Get Array
        var _array = global.disabledSlots.player;
    	if i == 1 then _array = global.disabledSlots.enemy;
        
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
    }
    
    #endregion
    
    //Finish
    timeSourceCreate(2,kaosCardDone);
}