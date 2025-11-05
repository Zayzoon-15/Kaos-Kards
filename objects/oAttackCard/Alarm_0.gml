///@desc Action

//Arguments
var _args = array_concat([targetEnemy],card.info.extraArgs);

//Do Action
method_call(card.info.action,_args);