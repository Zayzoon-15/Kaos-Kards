//Set Scissor Value
scissorStuct = {x:0,y:0,w:0,h:0};
updateScissorValue = function()
{
    scissorStuct = {
        x : (SCREEN_WIDTH/2)-(bbox_left+160), //MAGIC NUMBERS ONCE MORE MWAHAHAHAHA >:D
        y : bbox_top,
        w : bbox_right - bbox_left,
        h : bbox_bottom - bbox_top
    }
}
updateScissorValue();

//Sorting Funcs
sorting = {
    type : function(_current, _next)
    {
        //Group By Type
        if _current.type != _next.type {
            return _current.type - _next.type;
        }
    
        //Change By Placement Id
        return _next.placementId - _current.placementId;
    },
    date : function(_current, _next)
    {
        return _current.date - _next.date;
    },
    alphabetical : function(_left = 0,_right = 0) {
        if _left.name < _right.name
        {
            return -1;
        } else if _left.name > _right.name
        {
            return 1;
        } else return 0;
    },
    
}

//Types
types = {
    all : 0,
    favs : 1,
    action : 2,
    dice : 3,
    kaos : 4
}

//Current
currentSort = sorting.type;
currentType = types.all;

//Seperation
maxScroll = 0;

//Search
searchText = "";

//Create Cards
createCards = function(_sortFunc = currentSort,_types = currentType)
{
    //Destroy Cards
    instance_destroy(oDBCard);
    
    //Set Current Vars
    currentSort = _sortFunc;
    currentType = _types;
    
    //Position
    var _startPos = new Vector2(bbox_left - 36, bbox_top + 120); //MAGIC NUMBERS I DONT CARE RAAAAAAAAAAAHHHH
    var _gap = new Vector2(sprite_get_width(sCardBlank)*1.15,sprite_get_height(sCardBlank)*1.15);
    
    //Row
    var _maxRow = 10;
    var _row = 0;
    var _rowId = 0;
    
    //Get Target Types
    var _allCards = array_concat(variable_struct_get_names(actionCards),variable_struct_get_names(diceCards),variable_struct_get_names(kaosCards));
    switch (_types) {
    	case types.action:
            _allCards = variable_struct_get_names(actionCards);
        break;
    	case types.dice:
            _allCards = variable_struct_get_names(diceCards);
        break;
    	case types.kaos:
            _allCards = variable_struct_get_names(kaosCards);
        break;
    }
    
    //Get Cards
    var _cards = [];
    for (var i = 0; i < array_length(_allCards); i++) {
        
        //Get Card
        var _info = undefined;
        if struct_exists(actionCards,_allCards[i]) then _info = struct_get_variable(actionCards,_allCards[i]);
        if struct_exists(diceCards,_allCards[i]) then _info = struct_get_variable(diceCards,_allCards[i]);
        if struct_exists(kaosCards,_allCards[i]) then _info = struct_get_variable(kaosCards,_allCards[i]);
        
        //Get Searched Cards
        var _addCard = true;
        searchText = string_upper(searchText);
        if searchText != ""
        {
            var _name = string_upper(_info.name)
            if !string_contains(_name,searchText)
            {
                _addCard = false;
            }
        }
        
        //Put In Array
        if _addCard then array_push(_cards,_info);
    }
    
    //Sort Cards
    if _sortFunc != undefined then array_sort(_cards, _sortFunc);
    
    //Create Cards
    var _inst = noone;
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
        _inst = instance_create_depth(_xPos,_yPos,depth-2,oDBCard,{
            info : _cards[i]
        });	
        _inst.x = _startPos.x;
        _inst.image_angle = -90;
        //_inst.y = _startPos.y;
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