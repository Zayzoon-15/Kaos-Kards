//Set Menu
global.menuOpen = true;

//Ease In
easeTime = 0;
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,60,"easeTime",0,1);

//Enemy Animation
sprite_index = enemyInfo.dog.sprite;
Enemy.SetupAnims(true,enemyInfo.dog,object_index);
Enemy.PlayAnim("idle",0,"",object_index);