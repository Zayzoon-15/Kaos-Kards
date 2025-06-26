
scale = 1;

shake = 0;

shadowY = 0;
shadowX = 0;
shadowSize = .01;

selected = false;

canPress = true;
locked = false;

spriteIdle = getEnemySprite(enemy).idle;
spriteSelected = getEnemySprite(enemy).win;
spriteLocked = getEnemySprite(enemy).locked;

info = getEnemyInfo(enemy);

text = info.text;
boxSize = info.boxSize;
locked = info.locked
