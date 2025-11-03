///@desc Action

//Arguments
var _args = array_concat([self.id,targetEnemy],card.info.extraArgs);

//Do Action
method_call(card.info.action,_args);