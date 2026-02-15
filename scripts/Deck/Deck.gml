

function createDeckType(_name,_sprite,_maxCards = 15,_maxTypes=[3,1,1]) constructor
{
    //Info
    name = _name;
    sprite = _sprite;
    maxCards = _maxCards;
    
    //Type
    maxActionCards = _maxTypes[0];
    maxDiceCards = _maxTypes[1];
    maxKaosCards = _maxTypes[2];
}


function initDeck() 
{
    //Deck Types
    globalvar deckTypes;
    
    deckTypes = {
        basic : new createDeckType("Basic",sDeck),
    };
    
    
    //Vars
    global.deckPlacementId = 0;
    global.deckCardAmount = 0;
    global.currentDeck = deckTypes.basic;
    
}