
global.showCards = true;
canPress = true;

//Give Cards
playerDeck = array_concat(playerDeck,cardsToGive);

//Tween
TweenEasyFade(0,1,0,30,EaseOutCubic);
TweenEasyScale(.2,.2,1,1,0,30,EaseOutElastic);

//Card
cardLayer = layer_create(depth - 100, "RewardCard");
arraySize = array_length(cardRewards);

if arraySize == 1
{
    cardIdPlus = 1;
} else cardIdPlus = 0;

for (var i = 0; i < arraySize; i++) {
	var _x = room_width/2;
    var _y = room_height/2;
    var _cardId = i + cardIdPlus;
    instance_create_layer(_x,_y,cardLayer,oRewardCard,{
        cardId : i,
        placement : _cardId
    });
}


//Audio
alarm[0] = 10;