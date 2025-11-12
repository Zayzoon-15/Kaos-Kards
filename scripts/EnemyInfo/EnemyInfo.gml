function initEnemyinfo()
{



globalvar enemyInfo;

enemyInfo = {
    
    //Main Crew
    dog : new createEnemy("Dog the Duck",sDog,[actionCards.slash,actionCards.bread],[kaosCards.freeze],0,0,100),
    
    angel : new createEnemy("Angel the Juvenile",sAngel,[actionCards.poison,actionCards.flamingAce,actionCards.laser],[kaosCards.high],100,100,0),
    
    cock : new createEnemy("Cock the Bug",sCock,[actionCards.poison,actionCards.bread],[kaosCards.destroy],80,15,10),
	
    alien : new createEnemy("Alan the Alien",sAlien,[actionCards.laser,actionCards.bread],[kaosCards.swap],90,45,70),
    
    beer : new createEnemy("Beer the Pickle",sBeer,[actionCards.punch,actionCards.laser,actionCards.poison,actionCards.bread],[kaosCards.destroy,kaosCards.high,kaosCards.swap,kaosCards.swoop],80,30,65),
};



}