//Get Info
info = global.currentEnemy;
ai = structMerge(info.difficulty,info.strat,false);
print(ai);

//Setup Vars
goal = "ATTACK";
diceVals = [0,0,0];
hand = array_concat(info.cardsAct,info.cardsKaos);
chosenCards = [undefined];


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
    if _hpRatio < 0.3 return "SURVIVE";
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
        switch (_aiChooseGoal()) {
            
        	case "ATTACK":
                if _card.genre == CARDACT_GENRES.ATTACK { 
                    _score += 10 * ai.aggression;
                }
            break;
            
            
        	case "SURVIVE":
                if _card.genre == CARDACT_GENRES.HEAL { 
                    _score += 8 * ai.healBias;
                }
                
                if _card.genre == CARDACT_GENRES.DEFEND { 
                    _score += 8 * ai.blockBias;
                }
            break;
            
        	case "FINISH":
                if _card.genre == CARDACT_GENRES.ATTACK { 
                    _score += 15;
                }
            break;
        }
        
        //Situation Boosts
        if global.enemyHp <= 15 and _card.genre != CARDACT_GENRES.ATTACK
        {
            _score += 5;
        }
        
        if global.playerHp <= 15 and _card.genre == CARDACT_GENRES.ATTACK
        {
            _score += 5;
        }
        
    } /*else if _card.type == CARDTYPES.KAOS {
        
        //Increase Desire
    	_score += 10 * ai.kaosLove;
        
        //If Losing Use Kaos
        if global.enemyHp < global.playerHp - 10
        {
            _score += 3;
        }
        
        //About To Win Don't Use Kaos
        if global.playerHp <= 15
        {
            _score -= 10;
        }
        
    }*/
    
    //Random
    _score += irandom_range(-2,2);

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
        
        _kaosScore += 10 * ai.kaosLove;
        
        if global.enemyHp < global.playerHp - 10
        {
            _kaosScore += 5;
        }
        
        if irandom_range(1,8) == 1
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
    if _avg < 3 then _rerollScore += 20;
    
    //One Bad Die Upgrade
    if _lowest < 3 then _upgradeScore += 10;
    
    //Strat Influence
    _rerollScore += (1 - ai.kaosLove) * 5;
    _upgradeScore += (ai.aggression * 3)  - abs(1-ai.kaosLove);

    //Choose Best Option
    if _kaosScore > _rerollScore and _kaosScore > _upgradeScore {
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
    
    //Mess Up Small
    if ai.skill > 0.6 {
        if random(1) < 0.7 return _array;
    }
    
    //Mess Up
    if ai.skill > 0.3
    {
        if random(1) < 0.5 {
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

//Pre Choice
_aiApplyPreAction();

//Goal
_aiChooseGoal();

//Choose Slot Placement
var _assignment = array_create(3,undefined);
for (var i = 0; i < array_length(diceVals); i++) {
    
    //Setup Values
	var _val = diceVals[i];
    var _bestScore = -1;
    var _bestIndex = -1;
    
    //Get Best Card
    for (var k = 0; k < array_length(hand); k++) {
    	var _card = hand[k];
        
        var _score = _scoreCard(_card);
        
        if _score > _bestScore
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
