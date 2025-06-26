
rollDone = false;
diceNum = undefined;
rollTime = 20*diceId;
rolling = false;

setSize(1.1,1.1);

//State
enum DICESTATE {
	IDLE,
    COMBINE
}

state = DICESTATE.IDLE;

//Function
rollDice = function()
{
    rollDone = false;
    rolling = true;
    diceNum = undefined;
    sprite_index = spriteRoll;
    alarm[0] = rollTime;
    
    //Reroll Card
    if instance_exists(oCardReroll)
    {
        with oCardReroll
        {
            if state == CARDSTATE.PLACED
            {
                slot.used = true;
                instance_destroy();
            }
        }
    }
}

diceJuice = function()
{
    setSize(image_xscale+1,image_yscale+1);
    y += 10;
    
    //Audio
    var _sound = asset_get_index($"snStars{irandom_range(1,2)}");
    audio_play_sound(_sound,0,false);
    
    starEffect(x,y,5);
}

combineValues = function()
{
    alarm[2] = 30*diceId;
}

//Dice Range
range = {
    min : 1,
    max : 6
};


diceType = 6;
scale = 1;

numColor = c_white;
spriteIdle = sprite_index;
spriteRoll = sDice6Roll;