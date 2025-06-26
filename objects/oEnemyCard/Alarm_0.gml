showRange = true;
currentRange = irandom_range(cardInfo.range.min,cardInfo.range.max);

switch (cardId) {
	case 0:
        currentRange += oEnemyHand.diceOne;
    break;
    
    case 1:
        currentRange += oEnemyHand.diceTwo;
    break;
    
    case 2:
        currentRange += oEnemyHand.diceThree;
    break;
}