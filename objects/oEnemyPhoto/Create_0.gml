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
enemyPlayAnim("idle");

//Hover
canHover = true;

//Talking
alarm[1] = 80;

//Functions
hurt = function()
{
    //Play Animation
    enemyPlayAnim("hurt");
    shake += 15;
    
    //Start Reset
    alarm[0] = 40;
}

win = function(_stars = true)
{
    //Play Animation
    enemyPlayAnim("win");
    
    //Stars
    if _stars then effectStar(x,y,10,false,10,15);
    
    //Start Reset
    alarm[0] = 40;
}

talk = function()
{
    //Get Dialogue
    var _time = 120;
    var _text = global.currentEnemy.dialogue.text[0];
    if array_length(global.currentEnemy.dialogue.text) > 1
    {
        _text = global.currentEnemy.dialogue.text[irandom_range(0,array_length(global.currentEnemy.dialogue.text)-1)];
    }
    
    print($"ENEMY TALKING\n==========================\n{_text}");
    
    //Play Animation
    enemyPlayAnim("talk",_time,"idle");
    
    //Talk Again
    alarm[1] = random_range(120,300)+_time;
}