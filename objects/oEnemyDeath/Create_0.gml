shake = 5;

normalSprite = getEnemySprite().hurt;
deathSprite = getEnemySprite().lose;

sprite_index = normalSprite;

//Play Sound
audio_play_sound(snUhoh,0,false);

//Explode
deathTime = 60*7;
alarm[0] = 60*2;