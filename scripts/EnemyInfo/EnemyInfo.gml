function initEnemyinfo()
{



globalvar enemyInfo;

enemyInfo = {
    
    dog : new createEnemy("Dog The Duck",sButtonX,[actionCards.slash,actionCards.bread],[kaosCards.swoop],80,30,80),
    
    angel : new createEnemy("Angel The Teen",sButtonX,[actionCards.slash,actionCards.laser],[kaosCards.high],100,40,80),
    
    
};



}