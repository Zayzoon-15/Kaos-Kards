
//Destroy Stuff
with oParAttacks
{
    starEffect(x,y,10,-40,40,-60,60);
    instance_destroy();
}

with oAttackCard
{
    starEffect(x,y,10,-40,40,-60,60);
    instance_destroy();
}

with oEnemyAttackCard
{
    starEffect(x,y,10,-40,40,-60,60);
    instance_destroy();
}

with oParHealthBar
{
    starEffect(x,y,10,-200,200,-70,70);
    instance_destroy();
}

instance_destroy(oAttackEffects);

//Create Enemy Death
with oEnemyPhoto
{
    instance_create_layer(x,y,layer,oEnemyWin);
    instance_destroy();
}

//Set GameState
gamestate = GAMESTATE.PLAYERLOSS;