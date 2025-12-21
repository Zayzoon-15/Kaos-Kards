//Destroy Stuff
if gameover and alpha >= .9
{
	instance_destroy(oBrawlChar);
	instance_destroy(oBrawlHp);
	instance_destroy(oBrawlMap);
}



//No Fxs
if fxLayer == undefined then exit;

//Get Params
var _params_struct = fx_get_parameters(fxLayer);

//Set Params
pixelAmount = lerp(pixelAmount,0,.08);
_params_struct.g_CellSize = pixelAmount;

//Apply Params
fx_set_parameters(fxLayer, _params_struct);