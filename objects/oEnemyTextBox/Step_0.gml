//Destroy If Enemy No Exist
if !instance_exists(oEnemyPhoto){
    instance_destroy();
    exit;
}

//Set Correct Position
x = (oEnemyPhoto.bbox_left - 10) - sprite_width;
y = oEnemyPhoto.y - floor(sprite_height/2);

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