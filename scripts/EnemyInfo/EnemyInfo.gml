function initEnemyinfo()
{



globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    //Main Crew
    dog : new enemyCreate("Dog the Duck",sDog,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.bread,actionCards.bread,actionCards.bread,actionCards.slash,actionCards.slash],[kaosCards.swoop]),
    
    angel : new enemyCreate("Angel the Juvenile",sAngel,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.flamingAce,actionCards.flamingAce,actionCards.laser,actionCards.laser],[kaosCards.high]),
    
    cock : new enemyCreate("Cock the Bug",sCock,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.poison,actionCards.poison,actionCards.bread,actionCards.bread],[kaosCards.destroy]),
	
    alien : new enemyCreate("Alan the Alien",sAlien,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.laser,actionCards.laser,actionCards.bread,actionCards.bread],[kaosCards.swap,kaosCards.freeze]),
    
    beer : new enemyCreate("Beer the Pickle",sBeer,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.laser,actionCards.laser],[kaosCards.rps],new enemyCreateStrat(),enemySpecialBeer),
    
    //Retro Crew
    chud : new enemyCreate("Ichiro Uzumaki the Chud",sChud,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.mirror,actionCards.mirror,actionCards.ghost],[kaosCards.brawl]),
    
    //Spooky Crew
    bones : new enemyCreate("Jones the Living Bones",sBones,[actionCards.heal,actionCards.shield,actionCards.heal,actionCards.shield,actionCards.slash,actionCards.slash,actionCards.flamingAce,actionCards.flamingAce],[kaosCards.sticky]),
    
    //Joke
    cosmo : new enemyCreate("Cosmo The Goat",sCosmo,[actionCards.heal,actionCards.heal,actionCards.shield,actionCards.ghost,actionCards.bread,actionCards.bread,actionCards.bread,actionCards.flamingAce,actionCards.laser,actionCards.laser,actionCards.punch],[kaosCards.brawl,kaosCards.swoop],new enemyCreateStrat(40,60,10,70,0,0,0,30,3,3),enemySpecialCosmo),
};



}