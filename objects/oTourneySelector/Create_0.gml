#region Create Capsules

//Get Info
var _array = struct_get_names(tourneyInfo);
var _centerPos = new Vector2(oTourneyCapsule.x,oTourneyCapsule.y);

//Order Array
array_sort(_array,function(_cur,_next)
{
    return struct_get(tourneyInfo,_next).placement - struct_get(tourneyInfo,_cur).placement;
})

//Destroy Og Capsule
instance_destroy(oTourneyCapsule);

//Create Capsules
for (var i = 0; i < array_length(_array); i++) {
    
    var _info = struct_get(tourneyInfo,_array[i]);
    
	instance_create_layer(_centerPos.x,_centerPos.y,"Buttons",oTourneyCapsule,{
        capsuleId : i,
        centerPos : _centerPos,
        info : _info
    });
}

#endregion

//Capsules
selectedCapsule = 0;
totalCapsules = array_length(_array)-1;

//Scrolling
scrolling = false;
lastSelectionScroll = 0;

//Dragging
dragging = false;
dragPos = new Vector2();
dragOffset = new Vector2();
lastDragCapsule = 0;

//Keys
keyHeld = undefined;
keyHoldFrames = 0;
keyHoldTime = 30;

//Get Art
var _art = layer_sprite_get_id("Assets","graphicTourneyArt");
artPos = new Vector2(layer_sprite_get_x(_art), layer_sprite_get_y(_art));
artScale = new Vector2(1,1);
layer_sprite_destroy(_art);
