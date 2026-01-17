//Get Info
info = global.currentEnemy;

//Set Weights
weights = {
    "heal" : info.strat.healWeight,
    "defend" : info.strat.defendWeight,
    "dice" : info.strat.diceWeight,
    "combo" : info.strat.comboWeight,
    "special" : info.strat.specialWeight
};

//Set Values
hp = global.enemyHp;
values = {
    "heal" : info.strat.healValue,
    "defend" : info.strat.defendValue,
    "dice" : info.strat.diceValue,
    "special" : info.strat.specialValue,
    "specialUses" : info.strat.specialUses
}

//Cards
var _cardsHeal = [];
var _cardsDefend = [];
var _cardsAct = [];
var _cardsKaos = array_concat([],info.cardsKaos);

//Seperate Deck
for (var i = 0; i < array_length(info.cardsAct); i++) {
    switch (info.cardsAct[i].genre) {
    	case CARDACT_GENRES.HEAL: array_push(_cardsHeal,info.cardsAct[i]); break;
    	case CARDACT_GENRES.DEFEND: array_push(_cardsDefend,info.cardsAct[i]); break;
    	case CARDACT_GENRES.ATTACK: array_push(_cardsAct,info.cardsAct[i]); break;
    }
}

//Remove Cards
for (var i = 0; i < 4; i++) {
    
    //Get Array
	var _array;
    switch (i) {
    	case 0: _array = _cardsHeal; break;
    	case 1: _array = _cardsDefend; break;
    	case 2: _array = _cardsAct; break;
    	case 3: _array = _cardsKaos; break;
    }
    
    //Remove From Array
    for (var d = 0; d < array_length(global.enemyRemovedCards); d++) 
    {
        //Get Index
    	var _index = array_get_index(_array,global.enemyRemovedCards[d]);
        
        //Remove Card
        if _index != -1 then array_delete(_array,_index,1);
    }
    
    //Add To Array
    for (var d = 0; d < array_length(global.enemyAddCards); d++) 
    {
        switch global.enemyAddCards[d].genre
        {
            case CARDACT_GENRES.HEAL: array_push(_cardsHeal,global.enemyAddCards[d]); break;
            case CARDACT_GENRES.DEFEND: array_push(_cardsDefend,global.enemyAddCards[d]); break;
            case CARDACT_GENRES.ATTACK: array_push(_cardsAct,global.enemyAddCards[d]); break;
        }
    }
}

//Set Cards
cardsHeal = _cardsHeal;
cardsDefend = _cardsDefend;
cardsAct = _cardsAct;
cardsKaos = _cardsKaos;

//Set Deck
enemyDeck = array_concat(cardsHeal,cardsDefend,cardsAct,cardsKaos);

//Get Combo Card
combo = false;
var _targetCombo = cardsAct;
if enemyShouldHeal() then _targetCombo = array_concat(cardsDefend,cardsHeal,cardsAct);
cardsCombo = _targetCombo[irandom_range(0,array_length(_targetCombo)-1)];

//Stats
specialUsed = false;


//Get Dice Values
diceOutcome = [];
diceRoll = function()
{
    diceOutcome = [];
    repeat (3) {
        var _diceNum = irandom_range(1,6);
    	array_push(diceOutcome,_diceNum);
    }
}
diceRoll();


#region Actions

attack = function()
{
    //No Cards Left
    if array_length(cardsAct) <= 0 then return undefined;
    
    //Get Random Card
    var _index = irandom_range(0,array_length(cardsAct)-1);
    var _card = cardsAct[_index];
    
    //Remove From Array
    array_delete(cardsAct,_index,1);
    
    //Return Card
    return _card;
}

defend = function()
{
    //No Cards Left
    if array_length(cardsDefend) <= 0 then return undefined;
    
    //Get Random Card
    var _index = irandom_range(0,array_length(cardsDefend)-1);
    var _card = cardsDefend[_index];
    
    //Remove From Array
    array_delete(cardsDefend,_index,1);
    
    //Return Card
    return _card;
}

heal = function()
{
    //No Cards Left
    if array_length(cardsHeal) <= 0 then return undefined;
    
    //Get Random Card
    var _index = irandom_range(0,array_length(cardsHeal)-1);
    var _card = cardsHeal[_index];
    
    //Remove From Array
    array_delete(cardsHeal,_index,1);
    
    //Return Card
    return _card;
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
    var _targetDice = choose(0,2);
    diceOutcome[_targetDice] += irandom_range(diceCards.upgrade.range.min,diceCards.upgrade.range.max);
    
    //Set Special
    specialUsed = true;
}

placeKaos = function()
{
    //No Cards Left
    if array_length(cardsKaos) <= 0 then return undefined;
    
    //Get Random Card
    var _index = irandom_range(0,array_length(cardsKaos)-1);
    var _card = cardsKaos[_index];
    
    //Remove From Array
    array_delete(cardsKaos,_index,1);
    
    //Return Card
    return _card;
}

preformCombo = function()
{
	//Return Card
	return cardsCombo;
}

#endregion

//Do Special
if info.special != undefined and enemyCheckChance(weights.special) and values.special <= global.gameRound and global.enemySpecialUses <= values.specialUses
{
    info.special();
    global.enemySpecialUses ++;
}


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
var _special = chosenSpecialCard.evaluate();

//Add Combo
ds_list_set(enemyActions,0,combo);


//Get Kaos Card
if !specialUsed
{
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
        
        if _card == undefined
        {
            enemyAddCard(i+1,undefined,undefined,false);
        } else {
            //Get Card Value
            var _cardValue = irandom_range(_card.range.min,_card.range.min);
            var _totalValue = _cardValue + diceOutcome[i];
            
            //Add Enemy Action
            addEnemyAction(_card,_totalValue,i+1);
            
            
            //Add Card In Game
            enemyAddCard(i+1,_card,_totalValue);
        }
    } else {
        //Add Disabled Slot
        enemyAddCard(i+1,{},0,true,true);
    }
}