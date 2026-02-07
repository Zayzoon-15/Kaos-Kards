//Create Guys
instance_create_depth(0,0,depth,oHotdogGuy,{
    playerId : 0
});
instance_create_depth(0,0,depth,oHotdogGuy,{
    playerId : 1
});

//Start Game
timeSourceCreate(.5,function()
{
    with oHotdogGuy
    {
        if playerId == 0
        {
            alarm[0] = 1;
        }
    }
    
    gameStarted = true;
});
