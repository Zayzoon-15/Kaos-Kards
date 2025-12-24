//Set Position
y = oBrawlSetup.y - 20 - sprite_get_height(sBrawlMap)/2;
x = oBrawlSetup.x;

//Set Image
image_index = count;

//Tween
TweenEasyScale(0,0,1,1,0,10,EaseOutQuart);
TweenEasyFade(0,1,0,20,EaseOutCubic);
alarm[0] = 30;

//Sound
alarm[1] = 8;