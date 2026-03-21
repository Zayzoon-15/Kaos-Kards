///Scripts that change how the card moves in the players hand


///@self oCard
function cardHandMush(_handSize = ds_list_size(playerHand),_id = cardId,_center = room_width/2,_width = 780)
{    
	//Get Position
    var _gap = _width/(_handSize);
    var _leftEdge = _center - _gap * (_handSize-1)/2;
    var _handX = _leftEdge + _id * _gap;
    
    //Return X
    return _handX;
}

///@self oCard
function cardHandSep(_handSize = ds_list_size(playerHand), _id = cardId,_center = room_width/2,_gap = sprite_width+5)
{
	//Get Position
    var _leftEdge = (_handSize-1)*(_gap/2);
    var _handX = _center - _leftEdge + (_id * _gap);
    _handX = clamp(_handX,210,1070);
    
    //Return X
    return _handX;
}