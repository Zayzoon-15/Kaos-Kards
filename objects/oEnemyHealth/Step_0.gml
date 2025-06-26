//Clamp Hp
global.enemyHp = floor(global.enemyHp);
global.enemyTempHp = floor(global.enemyTempHp);
global.enemyHp = clamp(global.enemyHp,0,100);
global.enemyTempHp = clamp(global.enemyTempHp,0,100);

//Set Health
hp = lerp(hp,global.enemyHp,.2);
shield = lerp(shield,global.enemyTempHp,.2);

//Lerp Angle
image_angle = lerp(image_angle,0,.2);