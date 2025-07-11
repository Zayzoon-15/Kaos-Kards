
//Stats
hp = 80;


//Weights
healWeight = global.currentEnemy.healWeight;
attackWeight = global.currentEnemy.attackWeight;
defendWeight = global.currentEnemy.defendWeight;
diceWeight = global.currentEnemy.diceWeight;


//Cards Available
attacks = global.currentEnemy.attacks;
kaos = global.currentEnemy.kaos;
specialUsed = false;


//Dice Values
diceRoll = function()
{
    diceValues = [];
    repeat (3) {
        randomize();
        var _diceNum = irandom_range(1,6);
    	array_push(diceValues,_diceNum);
    }
    show_message(diceValues)
}
diceRoll();


#region Actions

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
    diceValues[_targetDice] += irandom_range(diceCards.upgrade.range.min,diceCards.upgrade.range.max);
    
    //Set Special
    specialUsed = true;
}

placeKaos = function()
{
    //Get Random Card
    randomize();
    var _card = irandom_range(0,array_length(kaos)-1);
    
    //Return Card
    return kaos[_card];
}

#endregion


//Set Actions
var _attack = new enemyActionNode(attack);
var _defend = new enemyActionNode(defend);
var _heal = new enemyActionNode(heal);
var _reroll = new enemyActionNode(reroll);
var _upgrade = new enemyActionNode(upgrade);
var _kaos = new enemyActionNode(placeKaos);


//Set Decisions
var _healCheck = new enemyDecisionNode(enemyHasHighHp(),_attack,_heal);
var _defendCheck = new enemyDecisionNode(enemyShouldDefend(),_defend,_healCheck);
var _upgradeDice = new enemyDecisionNode(enemyShouldUpgrade(),_upgrade,_kaos);
var _rerollDice = new enemyDecisionNode(enemyRolledLow(),_reroll,_upgradeDice);


//Ai Tree
chosenSpecialCard = _rerollDice;

chosenActionCards = [
_defendCheck,
_healCheck,
_healCheck,

];


//Use Special
chosenSpecialCard.evaluate();


//Get Kaos Card
if !specialUsed
{
    var _special = chosenSpecialCard.evaluate();
    if _special.type == CARDTYPES.KAOS
    {
        //Add Kaos
        addEnemyKaos(_special);
        
        //Add Card In Game
        enemyAddCard("EnemySpecialSlot",_special,undefined);
    }
}else //Special Used
{ 
    
    //Get Slot Id
    var _slotId = layer_sprite_get_id("Slots","EnemySpecialSlot");
    
    //Set Slot Size
    layer_sprite_xscale(_slotId,1);
    layer_sprite_yscale(_slotId,1);
    
    //Set Slot Alpha
    layer_sprite_alpha(_slotId,.7);
    
}


//Get Action Cards
for (var i = 0; i < array_length(chosenActionCards); i++) {
    
    //Get Card Info
	var _card = chosenActionCards[i].evaluate();
    
    //Get Card Value
    randomize();
    var _cardValue = irandom_range(_card.range.min,_card.range.min);
    var _totalValue = _cardValue + diceValues[i];
    
    //Add Enemy Action
    addEnemyAction(_card,_totalValue,i);
    
    //Add Card In Game
    enemyAddCard($"EnemyActionSlot{i+1}",_card,_totalValue);
}

