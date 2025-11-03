///@desc Card Conditions

//Dice Card Actions
if info.type == CARDTYPES.DICE
{
    //Get Arguments
    var _arguments = array_concat([info,self.id],info.extraArgs);
    
    //Call Action
    method_call(info.action,_arguments);
}