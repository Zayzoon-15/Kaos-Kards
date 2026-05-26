//Get Info
info = global.currentEnemy;
ai = structMerge(info.difficulty,info.strat,false);
print(ai);

//Setup Vars
goal = "ATTACK";
diceVals = [0,0,0];
hand = array_concat(info.cardsAct,info.cardsKaos);
chosenCards = [undefined];

//Add Enemy Cards
hand = array_concat(hand,global.enemyAddCards);

//Remove Cards
var _removeCards = array_concat([],global.enemyRemovedCards);

for (var i = 0; i < array_length(hand); ++i) {
    if hand[i].uses != NaN
	{
		//Set Uses
		var _uses = hand[i].uses;
		_uses -= checkCardUses(hand[i].name,"Enemy");
		if _uses <= 0
		{
			array_push(_removeCards,hand[i]);
			print($"CARD {hand[i].name} IS PAST ITS USED LIMIT");
		}
		
	}
}

for (var i = 0; i < array_length(_removeCards); ++i) {
	
	//Remove Card
	if array_contains(hand,_removeCards[i])
	{
		var _index = array_get_index(hand,_removeCards[i]);
		array_delete(hand,_index,1);
		print($"REMOVED {_removeCards[i].name} FROM ENEMY HAND");
	}
}


#region Functions For Ai


_rollDice = function()
{
    diceVals = [
        irandom_range(1,6),
        irandom_range(1,6),
        irandom_range(1,6),
    ]
}

_aiChooseGoal = function()
{
    //Get Health
    var _hpRatio = global.enemyHp / ai.maxHp;
    
    //Choose Goal
    if _hpRatio < 0.5 * ai.skill return "SURVIVE";
    if global.enemyComboMeter >= 100 return "COMBO";
    if global.playerHp < 10 return "FINISH"; //Player can die in one hit
    if random(1) < ai.kaosLove * 0.2 return "KAOS";
    return "ATTACK";
}

_scoreCard = function(_card)
{
    var _score = 0;
    
    //Choose Based On Goal
    if _card.type == CARDTYPES.ACTION
    {
        switch (goal) {
            
        	case "ATTACK":
                if _card.genre == CARDACT_GENRES.ATTACK { 
                    _score += 10 * ai.aggression;
                }
            break;
            
            
        	case "SURVIVE":
                if _card.genre == CARDACT_GENRES.HEAL { 
                    _score += 8 * ai.healBias;
                    _score -= ai.skill < 1 ? (1 - ai.skill) * 6 : 0;
                }
                
                if _card.genre == CARDACT_GENRES.DEFEND { 
                    _score += 8 * ai.blockBias;
                    _score -= ai.skill < 1 ? (1 - ai.skill) * 6 : 0;
                }
            break;
            
        	case "FINISH":
                if _card.genre == CARDACT_GENRES.ATTACK { 
                    _score += 15 * ai.skill;
                }
            break;
        
            case "COMBO":
                if _card.genre == CARDACT_GENRES.ATTACK { 
                    _score += 25 * ai.skill;
                }
            break;
        }
        
        //Situation Boosts
        if global.enemyHp <= 15 and _card.genre != CARDACT_GENRES.ATTACK
        {
            _score += 5 * ai.skill;
        }
        
        if global.playerHp <= 15 and _card.genre == CARDACT_GENRES.ATTACK
        {
            _score += (5 * ai.skill) * clamp((ai.aggression-.2)+1,1,10); 
        }
        
        //Random
        _score += irandom_range(-2,2) / ai.skill; 
    } else _score -= 30;

    //Return Score
    return _score;
}


_rankCards = function(_hand)
{
    var _array = [];
    
    for (var i = 0; i < array_length(_hand); i++) {
    	var _card = _hand[i];
        
        array_push(_array, {
            card : _card,
            score : _scoreCard(_card)
        });
    }
    
    return array_sort(_array,function(_index1,_index2)
    {
        return _index1.score - _index2.score;
    });
}


_aiChoosePreAction = function()
{
    //Setup Scores
    var _kaosScore = 0;
    var _rerollScore = 0;
    var _upgradeScore = 0;
    
    //Kaos Score
    for (var i = 0; i < array_length(info.cardsKaos); i++) {
        
        _kaosScore += 6 * ai.kaosLove;
        
        //Player Has Combo
        if global.playerComboMeter >= 100
        {
            _kaosScore += 5;
        }
        
        //Random Addition
        if irandom_range(1,3 / ai.kaosLove) == 1
        {
            _kaosScore += 2;
        }
    }
    
    //Dice Check
    var _avg = 0;
    var _lowest = 0;
    for (var i = 0; i < array_length(diceVals); i++) {
    	_avg += diceVals[i];
        _lowest = min(_lowest,diceVals[i]);
    }
    _avg /= array_length(diceVals);
    
    //Low Roll
    if _avg < 3 then _rerollScore += 15 * ai.skill;
    
    //One Bad Die Upgrade
    if _lowest < 3 then _upgradeScore += 10 * ai.skill;
    
    //Strat Influence
    _rerollScore += (1 - ai.kaosLove) * 8;
    _upgradeScore += (ai.aggression * 5)  - abs(1-ai.kaosLove);
    
    print("REROLL SCORE",_rerollScore);
    print("UPGRADE SCORE",_upgradeScore);
    print("KAOS SCORE",_kaosScore);

    //Choose Best Option
    if _kaosScore > _rerollScore and _kaosScore > _upgradeScore and goal != "COMBO" {
        return "KAOS";
    }
    
    if _rerollScore > _upgradeScore
    {
        return "REROLL";
    }
    
    return "UPGRADE";
}

_aiApplyPreAction = function()
{
    switch (_aiChoosePreAction()) {
    	
        case "REROLL":
            _rollDice();
            
            print("REROLLED DICE");
        break;
    	
        case "UPGRADE":
            
            //Get Lowest
            var _index = -1;
            var _lowest = 999;
            for (var i = 0; i < array_length(diceVals); i++) {
            	if diceVals[i] < _lowest
                {
                    _lowest = diceVals[i];
                    _index = i;
                }
            }
            
            //Upgrade
            diceVals[_index] += irandom_range(1,6);
            
            print("UPGRADED DICE");
        break;
        
        case "KAOS":
            var _kaos = info.cardsKaos[irandom_range(0,array_length(info.cardsKaos)-1)];
            chosenCards[0] = {
                card : _kaos,
                dice : 0
            };
        break;
    }
    
}

_applySkill = function(_array)
{
    //Smart Boy
    if ai.skill >= 1 return _array;
    
    ////Mess Up Small
    //if ai.skill > 0.6 {
        //if random(1) < 0.7 * (ai.skill+.4) return _array;
    //}
    
    //Mess Up
    if ai.skill >= 0.2
    {
        if random(1) < 0.4 * (ai.skill+.4) {
            var _a = irandom_range(0,array_length(_array)-1);
            var _b = irandom_range(0,array_length(_array)-1);
            
            while _b == _a
            {
                _b = irandom_range(0,array_length(_array)-1);
            }
            
            var _temp = _array[_a].card;
            _array[_a].card = _array[_b].card;
            _array[_b].card = _temp;
        }
        
        return _array;
    }
    
    //Dumb Asf
    array_shuffle(_array);
    return _array;
}

#endregion


#region Visible Functions

_addCard = function(_slotId,_info,_used = false,_disabled = false)
{
    //Get Full Value
    var _cardValue = undefined;
    if _info != undefined and _info.card.type == CARDTYPES.ACTION
    {
        _cardValue = _info.dice + irandom_range(_info.card.range.min,_info.card.range.max);
    }
    
    //Get Inst
    var _slotInst = _slotId != 0 ? oActionSlot : oSpecialSlot;

    //Get Pos
    var _x, _y;
    switch (_slotId) {
    	case 0: _x = 160; _y = 512; break;
    	case 1: _x = 440; _y = 360; break;
    	case 2: _x = 640; _y = 360; break;
    	case 3: _x = 840; _y = 360; break;
    }
    
    //Skipped
    if !_used and !_disabled and _info == undefined
    {
        global.enemyComboMeter += irandom_range(3,4);
    }

    //Create Slot
    var _slot = instance_create_layer(_x,_y,"Slots",_slotInst,{slotId : _slotId,});
    _slot.used = _used; //Set Used
    _slot.disabled = _disabled; //Set Disabled
    
    //Create Card
    if !_used and _info != undefined
    {
        instance_create_layer(_x,_y,"Cards",oEnemyCard,{
            info : _info.card,
            value : _cardValue,
            slotId : _slotId,
			slot : _slot
        });
    }
    
    //Add Card To Enemy
    if _info != undefined
    {
        if _info.card.type == CARDTYPES.ACTION
        { 
            addEnemyAction(_info.card,_cardValue,_slotId);
        } else addEnemyKaos(_info.card);
    }
    
}


#endregion


#region Begin Enemy Ai

//Roll Dice
_rollDice(); 

//Set Goal
goal = _aiChooseGoal();

//Pre Choice
_aiApplyPreAction();

//Choose Slot Placement
var _assignment = array_create(3,undefined);
for (var i = 0; i < array_length(diceVals); i++) {
    
    //Setup Values
	var _val = diceVals[i];
    var _bestScore = -1;
    var _bestIndex = 0;
    
    //Get Best Card
    for (var k = 0; k < array_length(hand); k++) {
    	var _card = hand[k];
        
        var _score = _scoreCard(_card);
        
        if _score > _bestScore and _card.type == CARDTYPES.ACTION
        {
            _bestScore = _score;
            _bestIndex = k;
        }
    }
    
    //Add Card
    _assignment[i] = {
        card : hand[_bestIndex],
        dice : _val
    }
    
    //Remove Duplicate Hand
    array_delete(hand,_bestIndex,1);
    
}

//Difficulty
_assignment = _applySkill(_assignment);

//Add To Chosen Cards
chosenCards = array_concat(chosenCards,_assignment);

//Set Combo Card
if goal == "COMBO" and chosenCards[1].card.genre == CARDACT_GENRES.ATTACK
{
    print("DO COMBO");
    for (var i = 1; i < array_length(chosenCards); i++) {
    	array_set(chosenCards,i,chosenCards[1]);
    }
    ds_list_set(enemyActions,0,true);
}

//Show Cards
for (var i = 0; i < array_length(chosenCards); i++) {

    if !global.disabledSlots.enemy[i]
    {
        if chosenCards[i] == undefined
        {
            _addCard(i,chosenCards[i],true,false);
        } else _addCard(i,chosenCards[i]);
        
    } else _addCard(i,undefined,true,true);
}
