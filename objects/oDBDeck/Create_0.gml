//Set Scissor Value
scissorStuct = {x:0,y:0,w:0,h:0};
updateScissorValue = function()
{
    scissorStuct = {
        x : (SCREEN_WIDTH/2)-(bbox_left+272), //MAGIC NUMBERS ONCE MORE MWAHAHAHAHA >:D
        y : bbox_top,
        w : bbox_right - 1 - bbox_left,
        h : bbox_bottom - bbox_top
    }
}
updateScissorValue();


//Max Scroll
maxScroll = 0;
lastCardId = 0;

//Create Cards
createCards = function()
{
    //Destroy Cards
    instance_destroy(oDBCard);
    
    //Position
    var _startPos = new Vector2(x-sprite_get_width(sCardBlank)*1.15, bbox_top + 90); //MAGIC NUMBERS I DONT CARE RAAAAAAAAAAAHHHH
    var _gap = new Vector2(sprite_get_width(sCardBlank)*1.15,sprite_get_height(sCardBlank)*1.15);
    
    //Row
    var _maxRow = 9;
    var _row = 0;
    var _rowId = 0;
    
    //Create Cards
    var _inst = noone;
    for (var i = 0; i < array_length(playerDeck); i++) {
        
        //Get Row
        _rowId ++;
        if _rowId > _maxRow
        {
            _row ++;
            _rowId = 1;
        }
        
    	//Get Position
        var _leftEdge = (_maxRow-1)*(_gap.x/2);
        var _xPos = _startPos.x - _leftEdge + (_rowId * _gap.x);
        var _yPos = _startPos.y + (_row * _gap.y);

        //Create Card
        _inst = instance_create_layer(_xPos,_yPos,"Cards",oDBCard,{
            info : playerDeck[i],
            cardId : i,
            row : _row,
            rowId : _rowId,
            gap : _gap,
            startPos : _startPos,
            maxRow : _maxRow
        });	
        _inst.x = _startPos.x;
        
        //Last Card Id
        lastCardId = i;
    }   
    
    //Max Scroll
    maxScroll = _inst != noone ? _inst.bbox_bottom - _startPos.y - (2.6 * _gap.y) : 0;
}
createCards();



//Scroll
scroll = 0;
scrollVel = 0;

//Mobile
mobileTouch = false;
mobileTouchLast = 0;
mobileTouchVel = 0;
mobileCanDrag = true;

#region Scroll Tuning

scrollFriction = 0.88; //How Quickly Momentum Slows Down | Big = Stops Faster  Small = Glides Longer
scrollMaxVel = 70; //Max Speed

//PC
pcScrollStep = 5; //How Far The List Moves | Big = More sensitive
pcScrollMomentum = 12; //How Much Velocity Is Added On Mouse | Big = Wheel Flick Glides Further

//Mobile
mobileScrollDrag = 1.4; //Multiplier For Drag Movement | Big = Faster  Small = Slower

#endregion