function initEnemyinfo()
{



globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    //Main Crew
    dog : new enemyCreate("Dog the Duck",sDog,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.bread,actionCards.bread,actionCards.bread,actionCards.slash,actionCards.slash],[kaosCards.swoop]),
    
    angel : new enemyCreate("Angel the Juvenile",sAngel,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.flamingAce,actionCards.flamingAce,actionCards.laser,actionCards.laser],[kaosCards.high]),
    
    cock : new enemyCreate("Cock the Bug",sCock,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.poison,actionCards.poison,actionCards.bread,actionCards.bread],[kaosCards.destroy]),
	
    alien : new enemyCreate("Alan the Alien",sAlien,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.laser,actionCards.laser,actionCards.bread,actionCards.bread],[kaosCards.swap,kaosCards.freeze]),
    
    beer : new enemyCreate("Beer the Pickle",sBeer,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.laser,actionCards.laser],[kaosCards.rps],new enemyCreateStrat(),enemySpecialBeer),
    
    //Retro Crew
    chud : new enemyCreate("Ichiro Uzumaki the Chud",sChud,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.mirror,actionCards.mirror,actionCards.ghost],[kaosCards.brawl]),
    
    handsy : new enemyCreate("Handsy The Hand",sHandsy,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.mirror,actionCards.mirror,actionCards.ghost],[kaosCards.brawl]),
    
    //Spooky Crew
    bones : new enemyCreate("Jones the Living Bones",sBones,enemyCreateAnims(),[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.slash,actionCards.slash,actionCards.flamingAce,actionCards.flamingAce],[kaosCards.sticky]),
    
};



}