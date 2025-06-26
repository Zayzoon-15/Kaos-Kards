
canPress = true;
cardUnused = false; 
sure = 0;

xscaleStart = image_xscale;
yscaleStart = image_yscale;

shadowY = 0;
shadowSize = 0.05;

textScale = 2;

shake = 0;


buttonPressed = function()
{
    gamestate = GAMESTATE.GETVALUES;
    
    //Skip Chaos Card
    var _timeBetween;
    with oCard 
    {
    	if state == CARDSTATE.PLACED and cardInfo.type != "Chaos"
        {
            _timeBetween = 1;
        } else _timeBetween = 0;
    }
    
    //Add More Time if Upgrade
    with oCardDiceUpgrade 
    {
    	if state == CARDSTATE.PLACED
        {
            _timeBetween = 2;
        }
    }
    
    //Give Values
    with oCard
    {
        if state == CARDSTATE.PLACED
        {
            if cardInfo.type == "Action"
            {
                alarm[0] = 30 * (slot.slotId+_timeBetween); 
            } else if cardInfo.type == "Dice"
            {
                alarm[0] = 30;
            }
        }
    }
    
    canPress = false;
}
