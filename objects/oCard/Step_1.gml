///@desc Card Conditions

//Dice Card Actions
if info.type == CARDTYPES.DICE
{
    //Get Arguments
    var _arguments = array_concat([info,self.id],info.extraArgs);
    
    //Call Action
    method_call(info.action,_arguments);
}

//Set Update
if struct_exists(info,"update")
{
    method_call(info.update);
}

//Check Uses
if uses <= 0 then canUse = false;