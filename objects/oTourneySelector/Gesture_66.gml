///@desc Drag Scrolling Start

//Set Dragging
dragging = true;

//Get Positions
var _x = event_data[?"posX"];
var _y = event_data[?"posY"];

//Set Offset
dragOffset.x = mouse_x;
dragOffset.y = mouse_y;

//Set Last Drag Capsule
lastDragCapsule = selectedCapsule;