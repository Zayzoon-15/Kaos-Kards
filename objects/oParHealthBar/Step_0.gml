
//Clamp Hp
global.playerHp = floor(global.playerHp);
global.playerTempHp = floor(global.playerTempHp);
global.playerHp = clamp(global.playerHp,0,100);
global.playerTempHp = clamp(global.playerTempHp,0,100);

//Set Health
hp = lerp(hp,global.playerHp,.2);
shield = lerp(shield,global.playerTempHp,.2);

//Lerp Angle
image_angle = lerp(image_angle,0,.2);