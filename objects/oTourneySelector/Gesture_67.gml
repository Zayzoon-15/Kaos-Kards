///@desc Drag Scrolling

//Menu Open
if global.menuOpen then exit;

//Get Positions
var _x = event_data[?"posX"];
var _y = event_data[?"posY"];

//Set Drag Positions
dragPos.x = _x - dragOffset.x;
dragPos.y = _y - dragOffset.y;

//Set Selected Capsule
selectedCapsule = lastDragCapsule - dragPos.y/100;
selectedCapsule = clamp(selectedCapsule,-.3,totalCapsules+.3); //Slight Offset To Make Drag Feel Nice