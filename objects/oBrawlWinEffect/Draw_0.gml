//Set Scissor Cut
var _scissor = gpu_get_scissor();
gpu_set_scissor(oBrawlSetup.scissorStruct);

//Draw
event_inherited();

//Reset Scissor Cut
gpu_set_scissor(_scissor);