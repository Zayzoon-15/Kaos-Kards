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


function enemyRolledLow()
{
    var _lowDice = 0;
    
    //Check If Dice Low
    if diceOutcome[0] <= 3 then _lowDice++;
    if diceOutcome[1] <= 3 then _lowDice++;
    if diceOutcome[2] <= 3 then _lowDice++;
    
    //If Low
    if _lowDice >= diceValue and enemyCheckChance(diceWeight)
    {
        return true;
    } else return false;
    
}

#endregion



#region Choices


function enemyShouldDefend()
{
    //Has Card
    if !array_contains(deck,actionCards.shield) return false;
    
    //Just Don't
    if defendWeight == 0 then return false;
    
    //Defend If Low
    if hp <= 30 then return false;
    
    //Defend
    if hp <= defendValue and enemyCheckChance(defendWeight)
    {
        return true;
    } else return false;
}


function enemyShouldUpgrade()
{
    return enemyCheckChance(diceWeight);
} 

function enemyShouldHeal()
{
    //Has Card
    if !array_contains(deck,actionCards.heal) return false;
    
    //Just Don't
    if healWeight == 0 then return false;
    
    //Heal If Low
    if hp <= healValue and enemyCheckChance(healWeight)
    {
        return true;
    }
    
    //Heal If Low But Not Bad
    if hp < clamp(healValue+20,0,95) and enemyCheckChance(10)
    {
        return true;
    }
    
    //Return False
    return false;
    
}

function enemyShouldHealAgain()
{
    //Has Card
    if !array_contains(deck,actionCards.heal) return false;
    
    //Just Don't
    if healWeight == 0 then return false;
    
    //Check
    return hp+15 <= healValue and enemyCheckChance(healWeight*.7);
}

function enemyShouldDefendAgain()
{
    //Has Card
    if !array_contains(deck,actionCards.shield) return false;
    
    //Just Don't
    if defendValue == 0 then return false;
    
    //Check
    return hp+25 <= defendValue and enemyCheckChance(defendWeight*.4);
}

function enemyShouldCombo()
{
	return global.enemyComboMeter >= 100 and enemyCheckChance(comboWeight);
}

#endregion