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
cardAngle = 0;
TweenFire(self,EaseOutQuart,TWEEN_MODE_ONCE,false,0,40,"cardAngle",180,0);

//Grabbing
canGrab = true;
canMove = true;
offsetX = 0;
offsetY = 0;
hover = false;
onMouse = 0;

//Placed
slot = noone;
wasPlaced = false;
wasOnSlot = false;
canPlace = true;
canUse = true;

//Dice Cards
targetDice = irandom_range(1,3);
followingDice = false;

//Values
currentValue = undefined;
rangeScale = 1;

//Set Uses
uses = info.uses;
if array_contains(global.cardUses.player,info.name)
{
    for (var i = 0; i < array_length(global.cardUses.player); i++) {
    	if global.cardUses.player[i] == info.name then uses --;
    }
}

//State
enum CARDSTATE
{
    HAND,
    GRABBED,
    PLACED
}

state = CARDSTATE.HAND;

#region Functions

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
    //Hover
    hover = true;
    
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
    //Set Values
    oDeck.cardsInPlay --;
    global.discards ++;
    
    //Reset Slot
    resetSlot();
    
    //Sound
    audioPlaySfx([snDiscard1,snDiscard2,snDiscard3]);
    
    //Destroy
    instance_destroy();
}

cardJuice = function()
{
    //Scale
    setSize(1.5,1.5);
    rangeScale += 1;
    
    //Angle
    image_angle += random_range(5,10)*choose(-1,1);
}

#endregion