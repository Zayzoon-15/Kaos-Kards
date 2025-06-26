
global.midTrans = false;
global.roomTarget = -1;

function transPlaceSequence(_type)
{
    if (layer_exists("Transitions")) layer_destroy("Transitions");
    var _layer = layer_create(-99999,"Transitions");
    layer_sequence_create(_layer,0,0,_type);
}

function transStart(_roomTarget,_typeOut,_typeIn)
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