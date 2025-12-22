//Set Position
y = oBrawlSetup.y - 20;
x = playerId == 1 ? x - 115 : x + 110;

//Set Sprite
sprite_index = playerId == 0 ? sBrawlHpRed : sBrawlHpBlue;
spriteBar = playerId == 0 ? sBrawlBarRed : sBrawlBarBlue;
dir = playerId == 1 ? 1 : -1;

//Health
hp = 100;
targetHp = 100;

//Shake
shake = 0;