
//Position
targetX = x;
targetY = y;

//Shadow
shadowX = 0;
shadowY = 0;
shadowSize = 0;

//Click
canPress = true;

//Tween
TweenEasyFade(0,1,0,30,EaseOutCubic);
TweenEasyScale(.2,.2,1,1,0,30,EaseOutElastic);

//Info
card = cardRewards[cardId];
cardInfo = cardRewardGetInfo(card);
sprite_index = object_get_sprite(card);