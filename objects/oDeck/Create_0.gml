//Inherit Parent Card
event_inherited();

#region --- Card Stuff ---

//Toggles
grabbable = true;
doBaseHoverJuice = false;
doCardSpin = false;
showInfo = false;

//Grab
grabTargetTime = 80;

//Shadow
baseShadowSize = shadowTargetSize;
shadowAlpha = 0;

//Depth
depthChange = 10;
depthBasedOnId = false;

#endregion


#region --- Setup Deck ---

//Create Players Hand
if !ds_exists(playerHand,ds_type_list)
{
    playerHand = ds_list_create();
} else ds_list_clear(playerHand);

//Set Deck Sprite
sprite_index = global.currentDeck.sprite;

//Deck Info
shuffleDeck = false;
deck = array_concat(global.playerFullDeck,[]);
placedCards = [];
drawTime = 10;

//Deck Stats
deckNum = 0;
totalCards = array_length(deck);
cardsLeft = totalCards;
cardsDiscarded = [];
currentCard = 0;
cardsInPlay = 0;

//Visuals
cardDeckSep = 2;

//Touhcing Deck Stack
touchingStack = false;

#endregion

#region --- Ui Menu ---

//Ui Box Stats
canHover = true;
height = 0;
width = 0;
heightMargin = 2;
widthMargin = 10;
maxWidth = 300;
tipBoxTouching = false;


#endregion


#region --- Card Functions ---

attemptedGrab = function() {
    createAlertMessage("This is where the deck menu would open",120);
    timeSourceCreate(1.5, createAlertMessage, ["Which we don't have right now...\n-_-",120]);
}

drawCard = function() {
	
    //Shuffle Deck
    if shuffleDeck{
		deckNum = array_length(deck) > 1 ? irandom_range(0, array_length(deck)-1) : 0;
	} else deckNum = 0;
	
    //Create Card
	var _x = room_width/2;
	var _y = 630;
    var _info = deck[deckNum];
	var _inst = instance_create_layer(_x,_y,"Cards",oCardPrepare,{
        cardId : currentCard,
        info : _info,
        index : deckNum
    });
	
	//Set Card Position To Start At Deck
	_inst.x = x;
	_inst.y = y;
	_inst.xprevious = x;
	_inst.yprevious = y;
	_inst.cardX = x;
	_inst.cardY = y;
    
    //Add To Array
    array_push(placedCards,_info);
    
    //Add To Hand
    ds_list_add(playerHand,_inst);
    
    //Delete From Deck Array
    array_delete(deck,deckNum,1);
    
    //Change Stats
    cardsLeft --;
    currentCard ++;
    deckNum ++;
    cardsInPlay ++;
    drawTime = 10;
    
    //Sound
    audioPlaySfx([snCardDraw1,snCardDraw2,snCardDraw3]);
    
}

#endregion