//Create Hand
if !ds_exists(playerHand,ds_type_list)
{
    playerHand = ds_list_create();
} else ds_list_clear(playerHand);

//Deck
shuffleDeck = false;
deck = playerDeck;
ogDeck = deck;
placedCards = [];

//Remove Cards
for (var i = 0; i < array_length(global.playerRemovedCards); i++) 
{
    //Get Index
    var _index = array_get_index(deck,global.playerRemovedCards[i]);
    
    //Remove Card
    if _index != -1 then array_delete(deck,_index,1);
}

//Add Cards
deck = array_concat(deck,global.playerAddCards);

//Enemy Deck
if room == rEnemy then deck = array_create(irandom_range(1,5),undefined);

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
	
    //Shuffle Deck If Needed (Gets a random number based on the deck size)
    if shuffleDeck then deckNum = irandom_range(0,array_length(deck)-1);
    
    //Create Card
	var _x = room_width/2;
	var _y = 630;
    var _info = deck[deckNum];
	var _inst = instance_create_layer(_x,_y,"Cards",oCard,{
        cardId : currentCard,
        cardInfo : _info,
        index : deckNum
    });
    
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
