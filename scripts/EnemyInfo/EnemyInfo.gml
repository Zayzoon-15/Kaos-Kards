function initEnemyinfo()
{



globalvar enemyInfo;

enemyInfo = {
    
    dog : new createEnemy("Dog the Duck",sDog,[actionCards.slash,actionCards.bread],[kaosCards.swoop],80,30,70),
    
    angel : new createEnemy("Angel the Juvenile",sAngel,[actionCards.flamingAce,actionCards.laser],[kaosCards.high],80,30,70),
    
    cock : new createEnemy("Cock the Bug",sCock,[actionCards.poison,actionCards.bread],[kaosCards.destroy],85,35,70),
	
    alien : new createEnemy("Alan the Alien",sAlien,[actionCards.laser,actionCards.poison],[kaosCards.swap],90,45,75),
    
    beer : new createEnemy("Beer the Pickle",sBeer,[actionCards.slash,actionCards.bread],[kaosCards.swoop],80,30,70),
};



}