

function createDeckType(_name,_sprite,_maxCards = 15) constructor
{
    //Info
    name = _name;
    sprite = _sprite;
    maxCards = _maxCards;
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