// Inherit the parent event
event_inherited();

//Hand
enemyActionCards = [

oEnemyCardHeal,
oEnemyCardShield,
oEnemyCardSlash,
oEnemyCardSlash,
oEnemyCardBread,
oEnemyCardBread,
oEnemyCardBread,
oEnemyCardBread,
oEnemyCardBread,

];

chaosCard = [
oEnemyCardWheat
];

randomize();
chaosChance = irandom_range(1,5);

cardRewards = [oCardBread,oCardWheat,oCardDiceUpgrade];
cardsToGive = [oCardBread,oCardBread,oCardBread,oCardWheat,oCardDiceUpgrade,oCardDiceUpgrade];