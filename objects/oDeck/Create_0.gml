//FOR NOW
gameState = GAMESTATES.PREPARE;


//Stats
totalCards = array_length(playerDeck);
cardsLeft = totalCards;
currentCard = 0;
cardsInPlay = 0;

//Create Hand
if !ds_exists(playerHand,ds_type_list)
{
    playerHand = ds_list_create();
} else ds_list_clear(playerHand);

//Deck
randomize();
deck = array_shuffle(playerDeck);
deckNum = 0;

//Draw Cards
drawTime = 10;

//Hover
canHover = true;

//Ui Box Stats
height = 0;
width = 0;
heightMargin = 2;
widthMargin = 10;
maxWidth = 300;


//Functions
drawCard = function(){
	
    //Create Card
	var _x = room_width/2;
	var _y = 630;
    var _info = deck[deckNum];
	var _inst = instance_create_layer(_x,_y,"Cards",oCard,{
        cardId : currentCard,
        info : _info
    });
    
    //Add To Hand
    ds_list_add(playerHand,_inst);
    
    //Change Stats
    cardsLeft --;
    currentCard ++;
    deckNum ++;
    cardsInPlay ++;
    drawTime = 10;
    
}