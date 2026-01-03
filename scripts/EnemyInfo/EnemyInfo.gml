function initEnemyinfo()
{



globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    //Main Crew
    dog : new createEnemy("Dog the Duck",sDog,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.bread,actionCards.bread,actionCards.bread,actionCards.slash,actionCards.slash],[kaosCards.swoop]),
    
    angel : new createEnemy("Angel the Juvenile",sAngel,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.flamingAce,actionCards.flamingAce,actionCards.laser,actionCards.laser],[kaosCards.high]),
    
    cock : new createEnemy("Cock the Bug",sCock,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.poison,actionCards.poison,actionCards.bread,actionCards.bread],[kaosCards.destroy]),
	
    alien : new createEnemy("Alan the Alien",sAlien,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.laser,actionCards.laser,actionCards.bread,actionCards.bread],[kaosCards.swap,kaosCards.freeze]),
    
    beer : new createEnemy("Beer the Pickle",sBeer,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.laser,actionCards.laser],[kaosCards.rps]),
    
    //Retro Crew
    chud : new createEnemy("Ichiro Uzumaki the Chud",sChud,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.mirror,actionCards.mirror,actionCards.ghost],[kaosCards.brawl]),
    
    //Spooky Crew
    bones : new createEnemy("Jones the Living Bones",sBones,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.slash,actionCards.slash,actionCards.flamingAce,actionCards.flamingAce],[kaosCards.sticky]),
};



}