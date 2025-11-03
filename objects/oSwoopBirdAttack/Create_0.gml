//Set State
states = {attackPlayer:0,attackEnemy:1};
state = targetEnemy;

//Set Value
value = clamp(value,1,99);

//Attack Player
event_user(targetEnemy);