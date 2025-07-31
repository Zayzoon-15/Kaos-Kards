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
    if diceValues[0] <= 3 then _lowDice++;
    if diceValues[1] <= 3 then _lowDice++;
    if diceValues[2] <= 3 then _lowDice++;
    
    //If Low
    if _lowDice >= 2 and enemyCheckChance(diceWeight)
    {
        return true;
    } else return false;
    
}

#endregion



#region Choices


function enemyShouldDefend()
{
    if hp <= 30 then return false;
    
    if hp <= 60 and enemyCheckChance(defendWeight)
    {
        return true;
    } else return false;
}


function enemyShouldUpgrade()
{
    if enemyCheckChance(diceWeight)
    {
        return true;
    } else return false;
} 

function enemyShouldHeal()
{
    //Heal If Low
    if hp <= 50 and enemyCheckChance(healWeight)
    {
        return true;
    }
    
    //Heal If Low But Not Bad
    if hp < 70 and enemyCheckChance(10)
    {
        return true;
    }
    
    //Return False
    return false;
    
}

function enemyShouldHealAgain()
{
    //Heal If Low
    if hp+15 <= 50 and enemyCheckChance(healWeight*.7)
    {
        return true;
    }
    
    //Return False
    return false;
}

#endregion