//Set Image
image_blend = c_gray;
image_xscale = 15;
image_yscale = 8.2;
boxWidth = (oDeckShowMenu.bbox_right - oDeckShowMenu.bbox_left)-90;

//Animate
TweenEasyScale(1,8.2,15,8.2,0,10,EaseOutCubic);

//Set Position
x = ROOM_CENTER.x;
y = ROOM_CENTER.y;

//Set Menu Open
global.menuOpen = true;

//Get Placed Cards
var _placedCards = array_concat(oDeck.placedCards,[]);
actionIds = 0;
diceIds = 0;
kaosIds = 0;

//Get Card Amount
totalCardsLeft = 0;
actionCardsLeft = 0;
diceCardsLeft = 0;
kaosCardsLeft = 0;

//Create Done Button
instance_create_depth(x,bbox_bottom-50,depth-1,oDeckShowBtn);

//Create Cards
for (var i = 0; i < array_length(playerDeck); i++) {
	
    //Get Card Id
    var _cardId = 0;
    totalCardsLeft ++;
    switch (playerDeck[i].type) {
    	case CARDTYPES.ACTION:
            _cardId = actionIds;
            actionIds ++;
            actionCardsLeft ++;
        break;
    	case CARDTYPES.DICE:
            _cardId = diceIds;
            diceIds ++;
            diceCardsLeft ++;
        break;
    	case CARDTYPES.KAOS:
            _cardId = kaosIds;
            kaosIds ++;
            kaosCardsLeft ++;
        break;
    }
    
    //Get Placed
    var _placed = false;
    if array_contains(_placedCards,playerDeck[i])
    {
        var _index = array_get_index(_placedCards,playerDeck[i]);
        array_delete(_placedCards,_index,1);
        _placed = true;
        
        //Remove From Cards Left
        totalCardsLeft --;
        switch (playerDeck[i].type) {
            case CARDTYPES.ACTION: actionCardsLeft --; break;
            case CARDTYPES.DICE: diceCardsLeft --; break;
            case CARDTYPES.KAOS: kaosCardsLeft --; break;
        }
    }
    
    instance_create_depth(x,y,depth-1,oDeckShowCards,{
        info : playerDeck[i],
        placed : _placed,
        cardId : _cardId,
        boxWidth : boxWidth
    });
}