//Create Hand
if !ds_exists(playerHand,ds_type_list)
{
    playerHand = ds_list_create();
} else ds_list_clear(playerHand);

//Deck
shuffleDeck = false;
deck = array_concat(global.playerFullDeck,[]);
ogDeck = deck;
placedCards = [];

//Set Stats
deckNum = 0;
totalCards = array_length(deck);
cardsLeft = totalCards;
cardsDiscarded = [];
currentCard = 0;
cardsInPlay = 0;

//Draw Cards
drawTime = 10;

//Drawing
targetX = x;
targetY = y;
xscale = 1;
yscale = 1;
angle = 0;
targetXLast = x;
startDepth = depth;

//Shadow
shadowX = 0;
shadowY = 0;
shadowSize = 0.05;

//Hover
canHover = true;
cardSep = 2;

//Ui Box Stats
height = 0;
width = 0;
heightMargin = 2;
widthMargin = 10;
maxWidth = 300;
tipBoxTouching = false;

//Mouse
grabbed = false;
pressed = false;
heldTime = 0;
offsetX = 0;
offsetY = 0;
touchingStack = false;

//Functions
drawCard = function() {
	
    //Shuffle Deck
    if shuffleDeck{
		deckNum = array_length(deck) > 1 ? irandom_range(0, array_length(deck)-1) : 0;
	} else deckNum = 0;
	
	print(deckNum);
	print(deck[deckNum].name);
	
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

sprite_index = global.currentDeck.sprite;
