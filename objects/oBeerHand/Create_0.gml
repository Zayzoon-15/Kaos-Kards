// Inherit the parent event
event_inherited();

//Hand
enemyActionCards = [

oEnemyCardHeal,
oEnemyCardShield,
oEnemyCardSlash,
oEnemyCardLaser,
oEnemyCardFreeze,
oEnemyCardFlame,
oEnemyCardPoison,
oEnemyCardFist,
oEnemyCardBread

];

chaosCard = [
oEnemyCardSwap,
oEnemyCardDestroy,
oEnemyCardHigh,
oEnemyCardWheat
];

randomize();
chaosChance = irandom_range(1,3);

cardRewards = [oCardFist,oCardLaser,oCardIou];
cardsToGive = [oCardFist,oCardFist,oCardFist,oCardLaser,oCardLaser,oCardLaser];