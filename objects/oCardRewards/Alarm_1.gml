///@desc Destroy
instance_destroy();
instance_destroy(oRewardCard);
layer_destroy(cardLayer);
global.giveCards = false;

if global.beatBeer and !global.beatEveryone
{
    instance_create_layer(0,0,"Ui",oBeatEveryone);
}