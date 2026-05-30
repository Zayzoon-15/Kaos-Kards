//Set Position
x = ROOM_CENTER.x;
y = ROOM_CENTER.y;

//Set Menu
global.menuOpen = true;

//Create Button
instance_create_depth(ROOM_CENTER.x,SCREEN_HEIGHT - 100,depth-1,oRewardButton);

//Effect
effectPlayed = false;

//Create Cards
var _maxPerRow = 4;
var _row = 0;
var _rowId = 0;
var _totalRows = ceil(array_length(cards) / _maxPerRow);
for (var i = 0; i < array_length(cards); i++) {
    
    //Set Current Row
    var _curRow = i div _maxPerRow;

    //Loop Row
    if (_row != _curRow)
    {
        _rowId = 0;
        _row = _curRow;
    }

    //Get Total Cards In Row
    var _cardsInRow = min(_maxPerRow,array_length(cards) - (_curRow*_maxPerRow));

    //Get Target Positions
    var _x = cardHandMush(_cardsInRow,_rowId,ROOM_CENTER.x,sprite_width*.6);
    var _y = cardHandSep(_totalRows,_curRow,ROOM_CENTER.y,sprite_get_height(sCardBlank)*.8)//cardHandMush(_totalRows,_curRow,ROOM_CENTER.y,sprite_height*.8);

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