

///@desc Checks to see if the message given is received
///@arg {string} _message The message to receive
///@arg {function} _func What to do if it receives the message
///@arg {bool} _sameAs Only recive the message if its from the current objects sprite (Default = false)
function spriteBroadcast(_message,_func,_sameAs = false)
{
    //Can Receive Message
    var _canReceive = true;
    
    //Check If Same Sprite
    if _sameAs
    {
        if layer_instance_get_instance(event_data[? "element_id"]) == id
        {
            _canReceive = true;
        } else _canReceive = false;
    }
    
    //Check Message
    if event_data[? "event_type"] == "sprite event" and _canReceive
    {
        //Do The Function
        if event_data[? "message"] == _message
        {
            _func();
        }
    }
}