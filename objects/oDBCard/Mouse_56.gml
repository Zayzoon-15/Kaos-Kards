///@desc Let Go
if grabbed
{
    //Set Grab
    global.holdingCard = false;
    grabbed = false;
    
    //Insert In Hole
    if place_meeting(x,y,oDBInsertHole)
    {
        removeCard();
    }
    
    //Swap Places
    if room == rDeckBuilder2
    {
        //Get Touching Instances
        var _list = ds_list_create();
        instance_place_list(x,y,oDBCard,_list,true);
        
        //Get Closest Instance
        var _closest = noone, _dist = infinity;
        for (var i = 0; i < ds_list_size(_list); i++) {
            
            //Get Inst
        	var _inst = ds_list_find_value(_list,i);
            
            //Get Distance
            var _curDist = point_distance(mouse_x,mouse_y,_inst.x,_inst.y);
            if _curDist < _dist
            {
                _dist = _curDist;
                _closest = _inst;
            }
        }
        
        //Swap Cards
        with _closest {
        	
            //Get Current Vars
            var _id = cardId;
            var _rowId = rowId;
            var _row = row;
            
            //Switch Array Place
            arraySwapIndex(playerDeck,cardId,other.cardId);
            
            //Switch Vars
            cardId = other.cardId;
            rowId = other.rowId;
            row = other.row;
            other.cardId = _id;
            other.rowId = _rowId;
            other.row = _row;
            
        }
        
        //Destroy List
        ds_list_destroy(_list);
    }
}