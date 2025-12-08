
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

function transStart(_roomTarget,_typeOut = seqFadeOut,_typeIn = seqFadeIn)
{
    if !global.midTrans
    {
        global.midTrans = true;
        global.roomTarget = _roomTarget;
        transPlaceSequence(_typeOut);
        layer_set_target_room(_roomTarget);
        transPlaceSequence(_typeIn);
        layer_reset_target_room();
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
    global.midTrans = false;
}