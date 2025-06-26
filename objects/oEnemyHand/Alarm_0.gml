///@desc Setup

//Change Into A Card
enemyCardHand = array_shuffle(enemyActionCards);
with oEnemyCard
{
    if cardInfo.name == "Name"
    {
        instance_change(other.enemyCardHand[other.currentActionCard],true);
        other.currentActionCard ++;
    }
}

//Create Chaos Card
randomize();
var _randomCard = irandom_range(0,array_length(chaosCard)-1);
var _card = chaosCard[_randomCard];

if chaosChance == 1
{
    instance_create_layer(143,511,"Cards",_card);
}