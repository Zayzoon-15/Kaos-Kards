//Position
targetX = x;
targetY = y;

//Card Position
cardX = x;
cardY = y;
cardTargetX = x;
cardTargetY = y;
cardXOffset = 0;
cardYOffset = 0;

//Info
uses = info.uses;

//Get Max Amount
maxCardAmount = 0;
switch (info.type) {
	case CARDTYPES.ACTION: maxCardAmount = global.currentDeck.maxActionCards; break;
    case CARDTYPES.DICE: maxCardAmount = global.currentDeck.maxDiceCards; break;
	case CARDTYPES.KAOS: maxCardAmount = global.currentDeck.maxKaosCards; break;
}

//Get Card Amount
cardAmount = 0;
for (var i = 0; i < array_length(playerDeck); i++) {
	if playerDeck[i] == info
    {
        cardAmount++;
    }
}

//Drawing
angle = 0;
shadowX = 0;
shadowY = 0;
shadowSize = 0.05;
shake = 0;
startDepth = depth;
sprite_index = info != undefined ? info.sprite : sprite_index;
cardVisible = false;
favorite = false;

//Grabbing
grabbed = false;
canGrab = true;
canMove = true;
offsetX = 0;
offsetY = 0;
hover = false;
hoverDir = 0;

//3d Card
cardFront = sprite_index;
cardBack  = global.currentDeck.sprite;
cardAngle = 0;
onMouse = 0;

//Fade
TweenEasyFade(0,1,0,20,EaseLinear);


//Remove From Deck
removeCard = function()
{
    if room == rDeckBuilder1
    {
        //Max Cards Reached
        if global.deckCardAmount >= global.currentDeck.maxCards
        {
            createAlertMessage("MAX CARDS IN DECK",50,ROOM_CENTER.x,150,fnDBLetter,1,4,.4);
            exit;
        }
        
        //Max Card Amount Reached
        if maxCardAmount-cardAmount <= 0
        {
            createAlertMessage("MAX CARD AMOUNT",50,ROOM_CENTER.x,150,fnDBLetter,1,4,.4);
            exit;
        }
        
        //Put In Deck
        array_push(playerDeck,info);
        global.deckCardAmount ++;
        
        //Create Card Again
        var _inst = instance_create_depth(targetX,targetY,startDepth,oDBCard,{
            info : info,
            scrollOffset : scrollOffset
        });
        _inst.xstart = xstart;
        _inst.ystart = ystart;
        
        //Destroy
        instance_destroy();
    } else {
        
        //Remove From Deck
        var _index = array_get_index(playerDeck,info);
        array_delete(playerDeck,_index,1);
        global.deckCardAmount --;
        
        //Reorder Cards
        oDBDeck.lastCardId --;
        with oDBCard
        {
            if other.cardId < cardId
            {
                rowId --;
                if rowId <= 0
                {
                    row --;
                    rowId = maxRow;
                }
            
                cardId --;
            }
        }
        
        //Destroy
        instance_destroy();
    }
    
    //Exit Animation
    instance_create_layer(x,y,"Effects",oDBCardTrans,{
        sprite_index : sprite_index,
        image_angle : image_angle,
        favorite : favorite
    });
}