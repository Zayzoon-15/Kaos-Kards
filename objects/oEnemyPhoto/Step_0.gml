//Set Sprite
sprite_index = global.currentEnemy.sprite;

//Play Animation
spriteLoopFrames(currentAnim,4);

//Draw Info
drawTipBox(global.currentEnemy.name, false);

//Move To Correct Position
x = getPosToWindow(true);
