shake = 0;

starEffect(x,y,20,-100,100,-100,100);

sprite_index = getEnemySprite().win;

//Play Sound
audio_play_sound(snUhoh,0,false);

//Explode
deathTime = 60*6;
alarm[0] = 60*2;