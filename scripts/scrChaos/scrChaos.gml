
#macro MESSAGE_X display_get_gui_width()/2
#macro MESSAGE_Y 200

function chaosDestroy(_struct)
{
    //Juice
    cardJuice(false);
    
    //Anounce
    showMessage("One Card On Each Side Is Destroyed",MESSAGE_X,MESSAGE_Y);
    
    //Time
    alarm[1] = 60*2;
    
    //Player
    randomize();
    var _playerHand = ds_list_size(playersActions)-1;
    var _targetPlayerCard = irandom_range(1,_playerHand);
    
    instance_create_layer(targetX,room_height+200,"Cards",oChaosDeletePlayer,{
        cardId : _targetPlayerCard,
    });
    
    //Enemy
    randomize();
    var _enemiesHand = ds_list_size(enemiesActions)-1;
    var _targetEnemiesCard = irandom_range(1,_enemiesHand);
    
    instance_create_layer(targetX,-200,"Cards",oChaosDeleteEnemy,{
        cardId : _targetPlayerCard
    });
    
}

function chaosSwap(_struct)
{
    //Juice
    setSize(image_xscale+.5,image_yscale+.5);
    image_angle += 360;
    
    //Anounce
    showMessage("All Cards Swaped",MESSAGE_X,MESSAGE_Y);
    
    //Time
    alarm[1] = 60*2;
    
    //Switch Hands
    var _playersHand = playersActions;
    var _enemiesHand = enemiesActions;
    
    playersActions = _enemiesHand;
    enemiesActions = _playersHand;
}

function chaosWheat(_struct)
{
    //Anounce
    showMessage("Choosing Target",MESSAGE_X,MESSAGE_Y);
    
    //Time
    alarm[1] = 60*5;
    
    //Start The Attack
    instance_create_layer(x,bbox_top - 50,"Attacks",oWheatChoose);
}

function chaosHalf(_struct)
{
    //Juice
    cardJuice(true);
    
    //Time
    alarm[1] = 60*2;
    
    //Anounce
    showMessage("All Card Values Halfed",MESSAGE_X,MESSAGE_Y);
    
    //Add Mult
    global.multiplier = 0.5;
}

function chaosHigh(_struct)
{
    //Juice
    cardJuice(true);
    
    //Time
    alarm[1] = 60*2;
    
    //Anounce
    showMessage("All Card Values Doubled",MESSAGE_X,MESSAGE_Y);
    
    //Add Mult
    global.multiplier *= 2;
}