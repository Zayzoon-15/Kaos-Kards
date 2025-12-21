
global.midTrans = false;
global.roomTarget = -1;

function transPlaceSequence(_type)
{
    if layer_exists("Transitions") then layer_destroy("Transitions");
    var _layer = layer_create(-99999,"Transitions");
	
	var _x = camera_get_view_x(view_camera[0]);
	var _xscale = camera_get_view_width(view_camera[0]);
	
    var _seq = layer_sequence_create(_layer,_x,0,_type);
	layer_sequence_xscale(_seq,_xscale);
}


///@desc Starts a transition to change the room
///If you want to use an object to transition, replace the _typeOut with the object you want
///@param {Asset.GMRoom} _roomTarget The target room
///@param {Asset.GMSequence} _typeOut The transition out
///@param {Asset.GMSequence} _typeIn The transition in
function transStart(_roomTarget,_typeOut = seqFadeOut,_typeIn = seqFadeIn)
{
    if !global.midTrans
    {
        global.midTrans = true;
        global.roomTarget = _roomTarget;
		
		//Transition Is Sequence
		if asset_get_type(_typeOut) == asset_sequence
		{
	        transPlaceSequence(_typeOut);
	        layer_set_target_room(_roomTarget);
	        transPlaceSequence(_typeIn);
	        layer_reset_target_room();
		} else {
			
			layer_set_target_room(_roomTarget);
			if layer_exists("Transitions") then layer_destroy("Transitions");
			layer_reset_target_room();
			
			if layer_exists("Transitions") then layer_destroy("Transitions");
			var _layer = layer_create(-99999,"Transitions");
			
			instance_create_layer(0,0,_layer,_typeOut);
		}
		
        return true;
    } else return false;
}

function transChangeRoom()
{
    room_goto(global.roomTarget);
}

function transFinished()
{
    layer_sequence_destroy(self.elementID);
	layer_destroy("Transitions");
    global.midTrans = false;
}