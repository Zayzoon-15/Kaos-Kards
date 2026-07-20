//Inherit
event_inherited();

//Info
flipSprite = false;
hitOthers = false;

//Set Size
setSize(2,2);

//Fade
TweenEasyFade(1,0,50,60,EaseLinear);
timeSourceCreate(110,function(){instance_destroy();},[],time_source_units_frames);

//Give Stuff
var _value = ceil(value);
var _stealValue = ceil(value*.7);
if targetEnemy
{
    global.playerComboMeter += _value;
    global.enemyComboMeter -= _stealValue;
    
    //Enemy Get Mad
    oEnemyPhoto.anim.play("hurt");
} else {
    global.playerComboMeter -= _stealValue;
    global.enemyComboMeter += _value;
    
    //Enemy Get Happy
    oEnemyPhoto.anim.play("win");
}

//Sound
audioPlaySfx(snTaunt);