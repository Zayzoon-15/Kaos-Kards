function initEnemyinfo()
{

Enemy();

globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    ///--- MAIN CREW ---///
    #region
    
    dog : new Enemy.Create("Dog the Duck",
        sDog, Enemy.Anims(), .25, .1, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.slash, actionCards.slash
        ],
        [kaosCards.swoop],
        Enemy.Strat(30,45,20,70,60,2,70)
    ),
    
    angel : new Enemy.Create("Angel the Juvenile",
        sAngel, Enemy.Anims(), .4, .8, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.flamingAce, actionCards.flamingAce, actionCards.flamingAce,
            actionCards.laser, actionCards.laser
        ],
        [kaosCards.high],
        Enemy.Strat(45,50,60,70,20,2,70)
    ),
    
    cock : new Enemy.Create("Cock the Bug",
        sCock, Enemy.Anims(), .55, .4, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.poison, actionCards.poison, actionCards.poison,
            actionCards.bread, actionCards.bread
        ],
        [kaosCards.brokenDefense],
        Enemy.Strat(55,60,65,80,40,2,60)
    ),
    
    alien : new Enemy.Create("Alan the Alien",
        sAlien, Enemy.Anims(), .7, .8, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.laser, actionCards.laser, actionCards.laser,
            actionCards.slash, actionCards.slash
        ],
        [kaosCards.swap],
        Enemy.Strat(65,60,65,70,60,2,80)
    ),
    
    ///--- BOSS ---///
    beer : new Enemy.Create("Beer the Pickle", 
        sBeer, Enemy.Anims(), .95, 1, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.laser, actionCards.laser, actionCards.laser,
            actionCards.bread, actionCards.flamingAce,
        ],
        [kaosCards.swoop,kaosCards.high],
        Enemy.Strat(70,60,75,80,67,2,100),enemySpecialBeer,["BeerPrepare","BeerIntro"]
    ),
    
    #endregion
    
    
    ///--- RETRO CREW ---///
    #region
    
    chud : new Enemy.Create("Ichiro Uzumaki the Chud",
        sChud, Enemy.Anims(2,2,2,2,{
            kaosHotDogStart: Enemy.AnimClip(8,13,false,"idle"),
            kaosHotDogLose : Enemy.AnimClip(21,3,true)
        }), 1.15, 3, 115,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.taunt, actionCards.bread, actionCards.bread,
        ],
        [kaosCards.brawl],
        Enemy.Strat(80,80,20,70,60,2,90)
    ),
    
    handsy : new Enemy.Create("Handsy the Hand",
        sHandsy, Enemy.Anims(), 1.25, 2, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.ghost, actionCards.ghost,
        ],
        [kaosCards.rps],
        Enemy.Strat(80,75,50,80,75,2,100)
    ),
    
    #endregion
    
    
    ///--- SPOOKY CREW ---///
    #region
    
    bones : new Enemy.Create("Jones the Living Bones",
        sBones, Enemy.Anims(), 2, 3, 130,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.flamingAce, actionCards.flamingAce, actionCards.flamingAce,
            actionCards.slash, actionCards.slash
        ],
        [kaosCards.hotdog],
        Enemy.Strat(85,75,70,85,40,2,100)
    ),
    
    
    #endregion
    
    
    ///--- CAMEOS ---///
    #region
    
    teto : new Enemy.Create("Kasane Teto the UTAU",
        sTeto, Enemy.Anims(), 1.4, 2.2, 115,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.punch, actionCards.punch,
            actionCards.steak, actionCards.steak,
        ],
        [kaosCards.hotdog,kaosCards.swoop],
        Enemy.Strat(85,80,50,75,45,2,100), undefined, ["TetoPrepare","TetoKaos"]
    ),
    
    
    #endregion
};



}