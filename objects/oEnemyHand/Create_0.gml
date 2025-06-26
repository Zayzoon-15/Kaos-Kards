
//The Cards The Enemy Should Have
enemyActionCards = [

oEnemyCardHeal,
oEnemyCardShield,
oEnemyCardSlash,
oEnemyCardSlash,
oEnemyCardSlash,
oEnemyCardSlash,

];

chaosCard = [oEnemyCardWheat];

randomize();
chaosChance = irandom_range(1,10);

currentActionCard = 0;
enemyCardHand = array_shuffle(enemyActionCards);


//Dice
randomize();
diceModded = false;
diceOne = irandom_range(1,6);
diceTwo = irandom_range(1,6);
diceThree = irandom_range(1,6);

var _diceChance = irandom_range(1,8);

if _diceChance == 1
{
    diceModded = true;
    instance_destroy(oEnemyCardKaos);
    
    var _diceToChange = irandom_range(1,3);
    
    switch (_diceToChange) {
    	
        case 1:
            diceOne += irandom_range(1,6);
        break;
        
        case 2:
            diceTwo += irandom_range(1,6);
        break;
        
        case 3:
            diceThree += irandom_range(1,6);
        break;
        
    }
}

currentCard = 0;

alarm[0] = 2;
alarm[1] = 5;