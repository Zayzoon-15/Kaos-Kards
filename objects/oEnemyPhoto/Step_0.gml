//Draw Info
drawTipBox(global.currentEnemy.name, false);

//Set To Right Side
x = global.stickUiToScreen ? getPosToWindow(true) : xstart;

//Set Sprite
sprite_index = global.currentEnemy.sprite;

//Animate
Enemy.SetupAnims(false);