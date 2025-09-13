///Scripts that change how the card moves in the players hand


///@self oCard
function cardHandMush()
{    
    //Get Hand Size
    var _handSize = ds_list_size(playerHand);
    
    //Center Cards
    var _center = room_width/2;
    var _width = 780;
    var _gap = _width/(_handSize);
    
    var _leftSide = _center - _gap * (_handSize-1)/2;
    var _handX = _leftSide + cardId * _gap;
    
    //Return X
    return _handX;
}

///@self oCard
function cardHandSep()
{
    //Get Hand Size
    var _handSize = ds_list_size(playerHand);
    
    //Center Cards
    var _center = room_width/2;
    var _gap = sprite_width+5;
    
    var _leftEdge = (_handSize-1)*(_gap/2);
    var _handX = _center - _leftEdge + (cardId * _gap);
    _handX = clamp(_handX,210,1070);
    
    //Return X
    return _handX;
}