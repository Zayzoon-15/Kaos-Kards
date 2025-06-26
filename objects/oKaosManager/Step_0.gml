
if playerDone and enemyDone and !instance_exists(oKaosOver)
{
    instance_create_layer(x,y,"Instances",oKaosOver);
}

gamestate = GAMESTATE.KAOS;

//Check Hp
if global.enemyHp <= 0
{
    instance_create_layer(x,y,layer,oPlayerWin);
    instance_destroy(oKaosOver);
    instance_destroy();
} else if global.playerHp <= 0
{
    instance_create_layer(x,y,layer,oPlayerLose);
    instance_destroy(oKaosOver);
    instance_destroy();
}