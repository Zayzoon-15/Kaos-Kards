//Set Menu
global.menuOpen = true;
audioPlaySong(noone);

//Delay
var _delay = 30;

//Ease In
easeTime = 0;
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,_delay,60,"easeTime",0,1);

//Bg
bgAlpha = 0;
cardsX = 0;
cardsY = 0;
TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,_delay,60,"bgAlpha",0,1);

//Flash
flashAlpha = 0;

//Text
textScale = 0;

//Enemy 
info = global.currentEnemy == undefined ? enemyInfo.dog : global.currentEnemy;
enemyX = SCREEN_EDGE.right + sprite_get_width(sprite_index);
enemyY = ROOM_CENTER.y;
enemyXScale = 1;
enemyYScale = 1;
enemyShake = 0;

//Enemy Animation Setup
anims = new animManager(info);
anims.play("idle");

//Intro Animation
var _time = 60;
TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,_delay,_time,"enemyX",enemyX,ROOM_CENTER.x - 100);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,_delay,_time,"enemyY",enemyY,ROOM_CENTER.y);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,_delay,_time,"enemyXScale",enemyXScale,1.5);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,_delay,_time,"enemyYScale",enemyYScale,1.5);
alarm[0] = _time+_delay+20;

//Sound
timeSourceCreate(_delay+10,function(){
    audio_play_sound(info.introSong,10,false);
},[],time_source_units_frames);