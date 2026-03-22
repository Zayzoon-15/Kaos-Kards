//Set Image
image_blend = c_gray;
image_xscale = 6.4;
image_yscale = 3.5;

//Set Position
x = ROOM_CENTER.x;
y = ROOM_CENTER.y;

//Setup Box
boxWidth = (oDeckShowMenu.bbox_right - oDeckShowMenu.bbox_left)*.5;
boxHeight = (oDeckShowMenu.bbox_bottom - oDeckShowMenu.bbox_top)-120;
boxPos = new Vector2(bbox_right - 45 - (boxWidth/2),y-45);

//Set Menu Open
global.menuOpen = true;

//Create Done Button
instance_create_depth(x,bbox_bottom-50,depth-1,oDeckShowDoneBtn);

instance_create_depth(bbox_left+195,y,depth-1,oDeckShowFullBtn);
instance_create_depth(bbox_left+195,y+100,depth-1,oDeckShowRemainBtn);



#region Setup Cards

//Ids
actionIds = 0;
diceIds = 0;
kaosIds = 0;

//Get Card Amount
totalCardsLeft = 0;
actionCardsLeft = 0;
diceCardsLeft = 0;
kaosCardsLeft = 0;

//Get Total Amounts
totalActionCards = 0;
totalDiceCards = 0;
totalKaosCards = 0;

//Show Placed
showPlaced = true;

#endregion


//Functions
createCards = function()
{
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
    
    //Get Total Amounts
    totalActionCards = 0;
    totalDiceCards = 0;
    totalKaosCards = 0;
    
    //Get Deck
    var _deck = array_concat(playerDeck,[]);
    var _sortFunc = function(_current, _next)
    {
        //Group By Type
        if _current.type != _next.type {
            return _current.type - _next.type;
        }
        
        if struct_exists(_current,"genre") and struct_exists(_next,"genre")
        {
            if _current.genre != _next.genre return _current.genre - _next.genre;
        }
        
        //Change By Placement Id
        return _next.placementId - _current.placementId;
    }
    array_sort(_deck,_sortFunc);
    
    //Create Cards
    for (var i = 0; i < array_length(_deck); i++) {
    	
        //Get Card Id
        var _cardId = 0;
        totalCardsLeft ++;
        switch (_deck[i].type) {
        	case CARDTYPES.ACTION:
                _cardId = actionIds;
                actionIds ++;
                actionCardsLeft ++;
                totalActionCards ++;
            break;
        	case CARDTYPES.DICE:
                _cardId = diceIds;
                diceIds ++;
                diceCardsLeft ++;
                totalDiceCards ++;
            break;
        	case CARDTYPES.KAOS:
                _cardId = kaosIds;
                kaosIds ++;
                kaosCardsLeft ++;
                totalKaosCards ++;
            break;
        }
        
        //Get Placed
        var _placed = false;
        if array_contains(_placedCards,_deck[i])
        {
            var _index = array_get_index(_placedCards,_deck[i]);
            array_delete(_placedCards,_index,1);
            _placed = true;
            
            //Remove From Cards Left
            totalCardsLeft --;
            switch (_deck[i].type) {
                case CARDTYPES.ACTION: actionCardsLeft --; break;
                case CARDTYPES.DICE: diceCardsLeft --; break;
                case CARDTYPES.KAOS: kaosCardsLeft --; break;
            }
        }
        
        instance_create_depth(boxPos.x,y,depth-1,oDeckShowCards,{
            info : _deck[i],
            placed : _placed,
            cardId : _cardId,
            boxWidth : boxWidth
        });
    }
}
createCards();


//Animate
TweenEasyFade(0,1,0,10,EaseOutCubic);
//TweenEasyMove(x,sprite_height+room_height,x,ROOM_CENTER.y,0,15,EaseOutBackSoft);
//TweenEasyScale(1,image_yscale,image_xscale,image_yscale,0,10,EaseOutCubic);