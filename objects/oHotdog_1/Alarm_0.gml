//Create Guys
instance_create_depth(0,0,depth,oHotdogGuy,{
    playerId : 0
});
instance_create_depth(0,0,depth,oHotdogGuy,{
    playerId : 1
});

//Alert
timeSourceCreate(1,createAlertMessage,["START"])

//Start Game
timeSourceCreate(1.5,function()
{
    //Startup Guys
    with oHotdogGuy
    {
        if playerId == 0
        {
            alarm[0] = 1;
        } else alarm[1] = 1;
    }
    
    //Start
    gameStarted = true;
    
    //Timer
    alarm[1] = 60;
});
