// Inherit the parent event
event_inherited();

//Hand
enemyActionCards = [

oEnemyCardHeal,
oEnemyCardShield,
oEnemyCardSlash,
oEnemyCardSlash,
oEnemyCardPoison,
oEnemyCardPoison,
oEnemyCardPoison,
oEnemyCardBread,
oEnemyCardBread,
oEnemyCardBread,


];

chaosCard = [
oEnemyCardDestroy
];

randomize();
chaosChance = irandom_range(1,9);

cardRewards = [oCardPoison,oCardDestroy,oCardDice12];
cardsToGive = [oCardPoison,oCardPoison,oCardPoison,oCardDestroy,oCardDice12];