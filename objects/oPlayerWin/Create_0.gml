
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
    instance_create_layer(x,y,layer,oEnemyDeath);
    instance_destroy();
}

//Set GameState
gamestate = GAMESTATE.PLAYERWIN;

hasBeaten = true;
switch (targetEnemy) {
	case "Dawg":
        if !global.beatDawg 
        {
            global.beatDawg = true;
            hasBeaten = false;
        }
    break;
    
	case "Angel":
        if !global.beatAngel 
        {
            global.beatAngel = true;
            hasBeaten = false;
        }
    break;
    
	case "Buggy":
        if !global.beatBuggy 
        {
            global.beatBuggy = true;
            hasBeaten = false;
        }
    break;
    
	case "Alien":
        if !global.beatAlien 
        {
            global.beatAlien = true;
            hasBeaten = false;
        }
    break;
    
	case "Beer":
        if !global.beatBeer 
        {
            global.beatBeer = true;
            hasBeaten = false;
        }
    break;
}

//Give Cards
if !hasBeaten {global.giveCards = true;}
