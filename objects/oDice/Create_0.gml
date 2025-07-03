
//Image
image_speed = 0;

//Dice Types
diceTypes =  {
    
    dice6 : {
        sprite : sDice6,
        range : {min:1,max:6},
        color : c_white
    },
    
    dice8 : {
        sprite : sDice8,
        range : {min:3,max:8},
        color : #f6e0ff
    },
    
    dice12 : {
        sprite : sDice12,
        range : {min:5,max:12},
        color : #d2ffff
    },
    
    dice20 : {
        sprite : sDice20,
        range : {min:8,max:20},
        color : #b23227
    },
    
}

dice = diceTypes.dice6;

//Dice
diceNum = undefined;
rolling = false;
rollDone = false;

//State
enum DICESTATE {
    IDLE,
    COMBINE
}

state = DICESTATE.IDLE;

//Functions
rollDice = function()
{
    //Spin
    image_speed = 1;
    
    //Finish Roll
    alarm[0] = 20*diceId;
    
    //Destroy Reroll
    with oCard
    {
        if info == diceCards.reroll and state == CARDSTATE.PLACED
        {
            slot.used = true;
            instance_destroy();
            starEffect(x,y,10);
        }
    }
    
    //Set Vars
    diceNum = undefined;
    rolling = true;
    rollDone = false;
    
}

diceJuice = function()
{
    //Move Down
    y += 10;
    
    //Set Size
    setSize(image_xscale+1,image_yscale+1);
    
    //Stars
    starEffect(x,y,5);
}