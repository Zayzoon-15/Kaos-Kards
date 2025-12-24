function initEnemyinfo()
{



globalvar enemyInfo;

enemyInfo = {
    
    //Main Crew
    dog : new createEnemy("Dog the Duck",sDog,[actionCards.slash,actionCards.bread],[kaosCards.swoop],80,50,60,65,70,2,80),
    
    angel : new createEnemy("Angel the Juvenile",sAngel,[actionCards.flamingAce,actionCards.laser],[kaosCards.high],80,70,50,85,50,2,0),
    
    cock : new createEnemy("Cock the Bug",sCock,[actionCards.poison,actionCards.bread],[kaosCards.destroy],85,75,25,80,30,2,0),
	
    alien : new createEnemy("Alan the Alien",sAlien,[actionCards.laser,actionCards.bread],[kaosCards.swap,kaosCards.freeze],70,70,45,80,70,2,0),
    
    beer : new createEnemy("Beer the Pickle",sBeer,
    [actionCards.punch,actionCards.laser,actionCards.poison,actionCards.bread],
    [kaosCards.destroy,kaosCards.high,kaosCards.swap,kaosCards.swoop],80,75,50,80,65,2,0),
    
    //Retro Crew
    chud : new createEnemy("Ichiro Uzumaki the Chud",sChud,[actionCards.punch,actionCards.slash,actionCards.laser,actionCards.mirror],[kaosCards.brawl,kaosCards.rps]),
};



}