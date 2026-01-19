//Set Scissor Value
scissorStuct = {x:0,y:0,w:0,h:0};
updateScissorValue = function()
{
    scissorStuct = {
        x : bbox_left,
        y : bbox_top,
        w : bbox_right - bbox_left,
        h : bbox_bottom - bbox_top
    }
}
updateScissorValue();

//Create Cards
createCards = function()
{
    //Position
    var _startPos = new Vector2(bbox_left - 36, bbox_top + 120); //MAGIC NUMBERS I DONT CARE RAAAAAAAAAAAHHHH
    var _gap = new Vector2(sprite_get_width(sCardBlank)*1.15,sprite_get_height(sCardBlank)*1.15);
    
    //Row
    var _maxRow = 10;
    var _row = 0;
    var _rowId = 0;
    
    //Cards
    var _cards = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
    
    //Create Cards
    for (var i = 0; i < array_length(_cards); i++) {
        
        //Get Row
        _rowId ++;
        if _rowId > _maxRow
        {
            _row ++;
            _rowId = 1;
        }
        
        //Get Position
        var _xPos = _startPos.x + (_rowId * _gap.x);
        var _yPos = _startPos.y + (_row * _gap.y);
        
        
        //Create Card
        instance_create_depth(_xPos,_yPos,depth-5,oDBCard);	
    }   
}
createCards();


//Scroll
scroll = 0;