//Set Menu
global.menuOpen = true;

//Ease In
easeTime = 0;
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,60,"easeTime",0,1);

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
TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,_time,"enemyX",enemyX,ROOM_CENTER.x - 100);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,_time,"enemyY",enemyY,ROOM_CENTER.y);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,_time,"enemyXScale",enemyXScale,1.5);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,_time,"enemyYScale",enemyYScale,1.5);
alarm[0] = _time+20;