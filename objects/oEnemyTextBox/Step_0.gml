//Show Text
if startTalking
{
    textShow = string_copy(text,0,textPos);
    textPos += textSpd;
}

//Animate Enemy
if textPos < string_length(text)+15
{
    Enemy.PlayAnim("talk");
}

//Text Done
if textPos >= string_length(text)+15 and !doneTalking
{
    //Set Enemy
    with oEnemyPhoto
    {
        Enemy.PlayAnim("idle");
        alarm[1] = irandom_range(120,300);
    }
    
    //Set Done
    doneTalking = true;
    
    //Leave
    alarm[0] = 70;
}