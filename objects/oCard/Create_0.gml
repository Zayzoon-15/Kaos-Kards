
//Position
targetX = x;
targetY = y;
x = oDeck.x;
y = oDeck.y;

//Card Position
cardX = x;
cardY = y;
cardTargetX = x;
cardTargetY = y;

//Drawing
shadowX = 0;
shadowY = 0;
shadowSize = 0.05;
shake = 0;
startDepth = depth;
sprite_index = info.sprite;

//Grabbing
canGrab = true;
canMove = true;
offsetX = 0;
offsetY = 0;

//Placed
slot = noone;
wasPlaced = false;
wasOnSlot = false;
canPlace = true;

//Dice Cards
randomize();
targetDice = irandom_range(1,3);


//State
enum CARDSTATE
{
    HAND,
    GRABBED,
    PLACED
}

state = CARDSTATE.HAND;

//Functions
resetSlot = function()
{
    if wasPlaced
    {
        slot.filled = false;
        slot = noone;
        wasPlaced = false;
    }
}

putCardInHand = function()
{
    
    //Add To Hand
    ds_list_add(playerHand,self);
    cardId = oDeck.currentCard;
    oDeck.currentCard ++;
    
    //Reset Slot
    resetSlot();
    
    //Change State
    state = CARDSTATE.HAND;
}

removeCardFromHand = function()
{
    //Remove Card From Hand
    if state == CARDSTATE.HAND
    {
        ds_list_delete(playerHand,cardId);
        
        with oCard
        {
            if cardId > other.cardId
            {
                cardId --;
            }
        }
        
        oDeck.currentCard --;
    }
}

deleteCard = function()
{
    oDeck.cardsInPlay --;
    oDiscard.discards ++;
    instance_destroy();
}