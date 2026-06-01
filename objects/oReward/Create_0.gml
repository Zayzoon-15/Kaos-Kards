//Set Position
x = ROOM_CENTER.x;
y = ROOM_CENTER.y;

//Set Menu
global.menuOpen = true;

//Create Button
instance_create_depth(ROOM_CENTER.x,SCREEN_HEIGHT - 100,depth-1,oRewardButton);

cards = [
    actionCards.bread,
    actionCards.slash,
    actionCards.laser,
]

//Angle
TweenEasyScale(0,0,1,1,0,30,EaseOutBack);
image_angle = 180;
targetAngle = 0;
angleSpd = .1;

//Effect
effectPlayed = false;

//Create Area
center = new Vector2(ROOM_CENTER.x,ROOM_CENTER.y);
maxWidth = sprite_get_width(sprite_index) * .6;
heightSep = sprite_get_height(sCardBlank)*.8;
maxPerRow = 4;

//Create Extra Rewards
if !array_is_empty(extra)
{
    //Create New Area
    center.x = ROOM_CENTER.x + 75;
    maxWidth = sprite_get_width(sprite_index) * .4;
    heightSep = 130;
    maxPerRow = 1;
    
    //Create Awards
    var _row = 0;
    var _rowId = 0;
    var _totalRows = ceil(array_length(extra) / maxPerRow);
    for (var i = 0; i < array_length(extra); i++) {
        
        //Set Current Row
        var _curRow = i div maxPerRow;
    
        //Loop Row
        if (_row != _curRow)
        {
            _rowId = 0;
            _row = _curRow;
        }
    
        //Get Total Items In Row
        var _itemsInRow = min(maxPerRow,array_length(extra) - (_curRow*maxPerRow));
    
        //Get Target Positions
        var _x = cardHandMush(_itemsInRow,_rowId,center.x,maxWidth); // + random_range(-15,15);
        var _y = cardHandSep(_totalRows,_curRow,center.y,heightSep); // + random_range(-15,15);
    
        //Create Items
        instance_create_depth(_x, _y, depth - 2, extra[i]);
    
        //Increase Row Id
        _rowId++;
    }
    
    //Set Card Area
    maxPerRow = 3;
    center.x = ROOM_CENTER.x - 75;
    heightSep = sprite_get_height(sCardBlank)*.8;
}


//Create Cards
var _row = 0;
var _rowId = 0;
var _totalRows = ceil(array_length(cards) / maxPerRow);
for (var i = 0; i < array_length(cards); i++) {
    
    //Set Current Row
    var _curRow = i div maxPerRow;

    //Loop Row
    if (_row != _curRow)
    {
        _rowId = 0;
        _row = _curRow;
    }

    //Get Total Cards In Row
    var _cardsInRow = min(maxPerRow,array_length(cards) - (_curRow*maxPerRow));

    //Get Target Positions
    var _x = cardHandMush(_cardsInRow,_rowId,center.x,maxWidth);
    var _y = cardHandSep(_totalRows,_curRow,center.y,heightSep);

    //Create Card
    instance_create_depth(_x, _y, depth - 2, oRewardCard, {
        info : cards[i],
        cardId : i
    });

    //Increase Row Id
    _rowId++;
}

//Give Cards To Player
global.playerFullDeck = array_concat(global.playerFullDeck,cards);