///@desc Talk

//No Talking
if global.currentEnemy.dialogue.talkChance == -1 or global.enemyHp <= 0 or !global.enemyDialogue then exit;

//Choose If Shouldn't Talk
if irandom_range(1,global.currentEnemy.dialogue.talkChance) != 1
{
    alarm[1] = random_range(70,150);
    exit;
}

//Talk
talk();
