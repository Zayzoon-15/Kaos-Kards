function initEnemyinfo()
{



globalvar enemyInfo;

enemyInfo = {
    
    dog : new createEnemy("Dog the Duck",sDog,[actionCards.slash,actionCards.bread],[kaosCards.swoop],80,30,70),
    
    angel : new createEnemy("Angel the Juvenile",sAngel,[actionCards.flamingAce,actionCards.laser],[kaosCards.high],100,40,70),
    
    cock : new createEnemy("Cock the Bug",sCock,[actionCards.poison,actionCards.bread],[kaosCards.swoop],80,30,70),
    
    beer : new createEnemy("Beer the Pickle",sBeer,[actionCards.slash,actionCards.bread],[kaosCards.swoop],80,30,70),
    
    cow : new createEnemy("BigMac the Cow",sCock,[actionCards.bread,actionCards.punch],[kaosCards.high,kaosCards.swap],10,30,100)
};



}