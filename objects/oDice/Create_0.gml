
//Image
image_speed = 0;

//Dice Types
dice = diceTypes.d6;

//Dice
diceNum = undefined;
rolling = false;
rollDone = false;
targetSlot = undefined;
skipped = false;
scale = 1;

//Events
diceFullyDone = false;

//State
diceStates = {
    idle : 0,
    combine : 1
};

state = diceStates.idle;

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

diceJuice = function(_sound = true)
{
    //Move Down
    y += 10;
    
    //Set Size
    setSize(image_xscale+1,image_yscale+1);
    
    //Stars
    starEffect(x,y,5,_sound);
}

combineValues = function()
{
    //Vars
    var _combine = false;
    var _diceCardExtra = 0;
    
    //Check Slots
    with oParSlots
    {
        if slotId == other.diceId and filled
        {
            other.targetSlot = self.id;
            _combine = true;
        }
    }
    
    //Combine More
    with oCard
    {
        if state == CARDSTATE.PLACED and info.type == CARDTYPES.DICE
        {
            _diceCardExtra = 1;
        }
    }
    
    //Next
    alarm[2] = 30*(diceId+_diceCardExtra);
}