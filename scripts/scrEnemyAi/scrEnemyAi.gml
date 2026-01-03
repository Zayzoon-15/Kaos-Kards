
///@self oEnemyAi
function enemyCheckChance(_weight)
{
    //Get Chance
    randomize();
    var _chance = irandom_range(1,100);
    
    if _chance <= _weight
    {
        return true;
    } else return false;
}


#region Conditions

///@self oEnemyAi
function enemyRolledLow()
{
    var _lowDice = 0;
    
    //Check If Dice Low
    if diceOutcome[0] <= 3 then _lowDice++;
    if diceOutcome[1] <= 3 then _lowDice++;
    if diceOutcome[2] <= 3 then _lowDice++;
    
    //If Low
    if _lowDice >= values.dice and enemyCheckChance(weights.dice)
    {
        return true;
    } else return false;
    
}

#endregion



#region Choices


function enemyShouldDefend()
{
    //Just Don't
    if weights.defend == 0 or array_length(cardsDefend) <= 0 then return false;
    
    //Defend If Low
    if hp <= 30 then return false;
    
    //Defend
    if hp <= values.defend and enemyCheckChance(weights.defend)
    {
        return true;
    } else return false;
}


function enemyShouldUpgrade()
{
    return enemyCheckChance(weights.dice);
} 

function enemyShouldHeal()
{
    //Just Don't
    if weights.heal == 0 or array_length(cardsHeal) <= 0 then return false;
    
    //Heal If Low
    if hp <= values.heal and enemyCheckChance(weights.heal)
    {
        return true;
    }
    
    //Heal If Low But Not Bad
    if hp < clamp(values.heal+15,0,95) and enemyCheckChance(10)
    {
        return true;
    }
    
    //Return False
    return false;
    
}

function enemyShouldHealAgain()
{
    //Just Don't
    if weights.heal == 0 or array_length(cardsHeal) <= 0 then return false;
    
    //Check
    return hp+15 <= values.heal and enemyCheckChance(weights.heal*.7);
}

function enemyShouldDefendAgain()
{
    //Just Don't
    if weights.defend == 0 or array_length(cardsDefend) <= 0 then return false;
    
    //Check
    return hp+25 <= values.defend and enemyCheckChance(weights.defend*.4);
}

function enemyShouldCombo()
{
	return global.enemyComboMeter >= 100 and enemyCheckChance(weights.combo);
}

#endregion