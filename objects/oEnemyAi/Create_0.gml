#region Stats

//Health
hp = global.enemyHp;

//Weights
healWeight = global.currentEnemy.healWeight;
defendWeight = global.currentEnemy.defendWeight;
diceWeight = global.currentEnemy.diceWeight;
comboWeight = global.currentEnemy.comboWeight

//Value
healValue = global.currentEnemy.healValue;
defendValue = global.currentEnemy.defendValue;
diceValue = global.currentEnemy.diceValue;

//Cards Available
attacks = global.currentEnemy.attacks;
kaos = global.currentEnemy.kaos;
specialUsed = false;
combo = false;

//Deck
deck = global.currentEnemy.deck;

//Get Combo Card
randomise();
comboCard = attacks[irandom_range(0,array_length(attacks)-1)];

#endregion

//Get Dice Values
diceRoll = function()
{
    diceOutcome = [];
    repeat (3) {
        randomize();
        var _diceNum = irandom_range(1,6);
    	array_push(diceOutcome,_diceNum);
    }
}
diceRoll();


#region Actions The Enemy Can Take

attack = function()
{
    //Get Random Card
    randomize();
    var _card = irandom_range(0,array_length(attacks)-1);
    
    //Return Card
    return attacks[_card];
}

defend = function()
{
    //Return Card
    return actionCards.shield;
}

heal = function()
{
    //Return Card
    return actionCards.heal;
}

reroll = function()
{
    //Reroll
    diceRoll();
    
    //Set Special
    specialUsed = true;
}

upgrade = function()
{
    //Upgrade Dice
    randomize();
    var _targetDice = choose(0,2);
    diceOutcome[_targetDice] += irandom_range(diceCards.upgrade.range.min,diceCards.upgrade.range.max);
    
    //Set Special
    specialUsed = true;
}

placeKaos = function()
{
    //Get Random Card
    randomise();
    var _card = irandom_range(0,array_length(kaos)-1);
    
    //Return Card
    return kaos[_card];
}

preformCombo = function()
{
	//Return Card
	return comboCard;
}

#endregion


//Set Actions
var _attack = new enemyActionNode(attack);
var _defend = new enemyActionNode(defend);
var _heal = new enemyActionNode(heal);
var _reroll = new enemyActionNode(reroll);
var _upgrade = new enemyActionNode(upgrade);
var _kaos = new enemyActionNode(placeKaos);
var _combo = new enemyActionNode(preformCombo);


//Set Decisions
var _healCheck = new enemyDecisionNode(enemyShouldHeal(),_heal,_attack);
var _healCheckAgain = new enemyDecisionNode(enemyShouldHealAgain(),_heal,_attack)
var _defendCheck = new enemyDecisionNode(enemyShouldDefend(),_defend,_healCheck);
var _defendCheckAgain = new enemyDecisionNode(enemyShouldDefend(),_defend,_healCheckAgain);
var _upgradeDice = new enemyDecisionNode(enemyShouldUpgrade(),_upgrade,_kaos);
var _rerollDice = new enemyDecisionNode(enemyRolledLow(),_reroll,_upgradeDice);

//Ai Tree
chosenSpecialCard = _rerollDice;

//Choose Cards
chosenActionCards = [
_defendCheck, //Defend Or Heal (if all good then attack)
_defendCheckAgain, //Defend, Heal or Attack
_healCheckAgain, //Heal or Attack

];

//Do Combo
if enemyShouldCombo()
{
	//Set Combo
	combo = true;
	
	//Set Actions
	chosenActionCards = [
		_combo,
		_combo,
		_combo,
	];
}


//Use Special
chosenSpecialCard.evaluate();


//Add Combo
ds_list_set(enemyActions,0,combo);

//Get Kaos Card
if !specialUsed
{
    var _special = chosenSpecialCard.evaluate();
    if _special.type == CARDTYPES.KAOS
    {
        //Add Kaos
        addEnemyKaos(_special);
        
        //Add Card In Game
        enemyAddCard(0,_special,undefined);
    }
}else //Special Used
{ 
    enemyAddCard(0,undefined,undefined,true);
}


//Get Action Cards
for (var i = 0; i < array_length(chosenActionCards); i++) {
    
    if !global.disabledSlots.enemy[i+1]
    {
        //Get Card Info
    	var _card = chosenActionCards[i].evaluate();
        
        //Get Card Value
        randomize();
        var _cardValue = irandom_range(_card.range.min,_card.range.min);
        var _totalValue = _cardValue + diceOutcome[i];
        
        //Add Enemy Action
        addEnemyAction(_card,_totalValue,i+1);
        
        //Add Card In Game
        enemyAddCard(i+1,_card,_totalValue);
    } else {
        //Add Disabled Slot
        enemyAddCard(i+1,{},0,true,true);
    }
}