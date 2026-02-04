//Animate
TweenEasyScale(.2,.2,1,1,0,40/60,EaseOutBack);
image_index = 1;

//Audio
audioPlaySfx(snOpenWindow);

//Music
lastSong = global.curSong;
audioPlaySong(noone,false,3000);

//Load Game
alarm[0] = 40;
gameover = false;
loser = -1;

//Fade
fade = false;
alpha = 0;

//Count
count = 0;

//Create Layer
brawlLayerTop = layer_create(depth-5,"BrawlTop");
brawlLayerBottom = layer_create(depth-2,"BrawlBottom");

//Pixelate Layer
fxLayer = fx_create("_filter_pixelate"); 
fx_set_single_layer(fxLayer,true);
pixelAmount = 500;
layer_set_fx(brawlLayerTop, fxLayer);
layer_set_fx(brawlLayerBottom, fxLayer);