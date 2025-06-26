// Inherit the parent event
event_inherited();

//Hand
enemyActionCards = [

oEnemyCardHeal,
oEnemyCardShield,
oEnemyCardLaser,
oEnemyCardLaser,
oEnemyCardLaser,
oEnemyCardFreeze,
oEnemyCardFreeze,
oEnemyCardFreeze,
oEnemyCardFlame,
oEnemyCardFlame,

];

chaosCard = [
oEnemyCardSwap
];

randomize();
chaosChance = irandom_range(1,5);

cardRewards = [oCardFreeze,oCardSwap,oCardDice20];
cardsToGive = [oCardFreeze,oCardFreeze,oCardFreeze,oCardSwap,oCardDice20];