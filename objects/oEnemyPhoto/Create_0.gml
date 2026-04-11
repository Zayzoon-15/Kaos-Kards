//Set Sprite
sprite_index = global.currentEnemy.sprite;

//Animation
animInfo = global.currentEnemy.animInfo;
frame = 0;
currentAnim = 0;
animationEnd = false;
shake = 0;
ignoreTime = 0;
resetAnim = "";
Enemy.PlayAnim("idle");

//Hover
canHover = true;

//Talking
alarm[1] = 80;

//Functions
hurt = function()
{
    //Play Animation
    Enemy.PlayAnim("hurt");
    shake += 15;
    
    //Start Reset
    alarm[0] = 40;
}

win = function(_stars = true)
{
    //Play Animation
    Enemy.PlayAnim("win");
    
    //Stars
    if _stars then effectStar(x,y,10,false,10,15);
    
    //Start Reset
    alarm[0] = 40;
}

talk = function()
{
    //Text Box Already Exists
    if instance_exists(oEnemyTextBox) then exit;
    
    //Who Is Winning
    var _dialouge = global.currentEnemy.dialogue.text;
    
    //Choose What Dialouge
    if irandom_range(1,3) == 1 and global.playerHp != global.enemyHp
    {
        if global.playerHp > global.enemyHp
        {
            _dialouge = global.currentEnemy.dialogue.textLose;
        } else _dialouge = global.currentEnemy.dialogue.textWin;
    }
    
    //Get Dialogue
    var _text = _dialouge[0]
    if array_length(_dialouge) > 1
    {
        _text = _dialouge[irandom_range(0,array_length(_dialouge)-1)];
    }
    
    //Create Text Box
    instance_create_depth(bbox_left - 10,y,depth,oEnemyTextBox,{
        text : _text
    });
}