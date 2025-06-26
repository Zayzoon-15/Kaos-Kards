
currentCards = 0;
cardsPicked = 0;
cardsInPlay = 0;

shake = 0;

finishedDrawing = false;

totalCards = array_length(playerDeck);
maxHandSize = global.playerHandSize;

//Deck
deck = array_shuffle(playerDeck);
deckNum = 0;


givePlayerCards = function()
{
    randomize();
    var _card = deck[deckNum];
    var _inst = instance_create_layer(room_width/2,640,"Cards",_card);
    _inst.cardId = currentCards;
    
    ds_list_add(playerHand,_inst);
    
    var _sound = asset_get_index($"snCard{irandom_range(1,3)}");
    audio_play_sound(_sound,0,false);
    
    deckNum ++;
    cardsInPlay ++;
    currentCards ++;
    cardsPicked ++;
}

startingCards = 0;
alarm[0] = 5;