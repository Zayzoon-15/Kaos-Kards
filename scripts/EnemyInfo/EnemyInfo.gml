function initEnemyinfo()
{



globalvar enemyInfo;

enemyInfo = {
    
    //Main Crew
    dog : new createEnemy("Dog the Duck",sDog,[actionCards.slash,actionCards.bread],[kaosCards.freeze],80,50,60,65,70,2),
    
    angel : new createEnemy("Angel the Juvenile",sAngel,[actionCards.flamingAce,actionCards.laser],[kaosCards.high],80,70,50,85,50,2),
    
    cock : new createEnemy("Cock the Bug",sCock,[actionCards.poison,actionCards.bread],[kaosCards.destroy],85,75,25,80,30,2),
	
    alien : new createEnemy("Alan the Alien",sAlien,[actionCards.laser,actionCards.bread],[kaosCards.swap],70,70,45,80,70,2),
    
    beer : new createEnemy("Beer the Pickle",sBeer,
    [actionCards.punch,actionCards.laser,actionCards.poison,actionCards.bread],
    [kaosCards.destroy,kaosCards.high,kaosCards.swap,kaosCards.swoop],80,75,50,80,65,2),
    
    //Retro
    chud : new createEnemy("Chud",sChud,[actionCards.gato],[kaosCards.swoop]),
};



}