function initEnemyinfo()
{

Enemy();

globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    ///--- MAIN CREW ---///
    #region
    
    dog : new Enemy.Create("Dog the Duck",
        sDog, Enemy.Anims(), Enemy.Dialogue(),
        .48, .1, 100,
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
        sAngel, Enemy.Anims(), Enemy.Dialogue(),
        .56, .8, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.flaminAce, actionCards.flaminAce, actionCards.flaminAce,
            actionCards.laser, actionCards.laser
        ],
        [kaosCards.high],
        Enemy.Strat(45,50,60,70,20,2,70)
    ),
    
    cock : new Enemy.Create("Cock the Bug",
        sCock, Enemy.Anims(), Enemy.Dialogue(),
        .67, .4, 100,
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
        sAlien, Enemy.Anims(), Enemy.Dialogue(),
        .75, .8, 100,
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
        sBeer, Enemy.Anims(), Enemy.Dialogue(10,"Bitch"),
        1, 1, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.laser, actionCards.laser, actionCards.laser,
            actionCards.bread, actionCards.flaminAce,
        ],
        [kaosCards.swoop,kaosCards.high],
        Enemy.Strat(70,60,75,80,67,2,100),enemySpecialBeer,["BeerIntro",["BeerKaos1","BeerKaos2"]]
    ),
    
    #endregion
    
    
    ///--- RETRO CREW ---///
    #region
    
    handsy : new Enemy.Create("Handsy the Hand",
        sHandsy, Enemy.Anims(), Enemy.Dialogue(5,"Wah wah wah, wah wah wah wah >:)","Wah wah wah! >:D","Wah wah... :("),
        1.15, 2, 100,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.ghost, actionCards.ghost,
        ],
        [kaosCards.rps],
        Enemy.Strat(80,75,50,80,75,2,100)
    ),
    
    ///--- BOSS ---///
    chud : new Enemy.Create("Ichiro Uzumaki the Chud",
        sChud, Enemy.Anims(2,2,2,2,4,{
            kaosHotDogStart: Enemy.AnimClip(8,13,false,"idle"),
            kaosHotDogLose : Enemy.AnimClip(21,3,true)
        }), Enemy.Dialogue(),
        1.25, 3, 115,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.taunt, actionCards.bread, actionCards.bread,
        ],
        [kaosCards.brawl],
        Enemy.Strat(80,80,20,70,60,2,90),function(){},["ChudIntro",["ChudKaos1","ChudKaos2"],"ChudMini"]
    ),
    
    #endregion
    
    
    ///--- SPOOKY CREW ---///
    #region
    
    bones : new Enemy.Create("Jones the Living Bones",
        sBones, Enemy.Anims(), Enemy.Dialogue(),
        2, 3, 130,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.flaminAce, actionCards.flaminAce, actionCards.flaminAce,
            actionCards.slash, actionCards.slash,
            actionCards.jerryCan,
        ],
        [kaosCards.hotdog],
        Enemy.Strat(85,75,70,85,40,2,100)
    ),
    
    
    #endregion
    
    
    ///--- CAMEOS ---///
    #region
    
    teto : new Enemy.Create("Kasane Teto the UTAU",
        sTeto, Enemy.Anims(2,2,2,2,2), Enemy.Dialogue(5,["Man, FUCK Complex bro"]),
        1.4, 2.2, 115,
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
    
    jsg : new Enemy.Create("Just Some Guy",
        sJsg, Enemy.Anims(), Enemy.Dialogue(),
        1.4, 2.2, 120,
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.punch, actionCards.punch,
            actionCards.steak, actionCards.steak,
        ],
        [kaosCards.hotdog,kaosCards.swoop],
        Enemy.Strat(85,80,50,75,45,2,100),
    ),
    
    pug : new Enemy.Create("Loulou the Pug",
        sPug, {idle : Enemy.AnimClip(0,41,true)}, Enemy.Dialogue(),
        1.5, 2.1, 85,
        [
            actionCards.steak, actionCards.heal,
            actionCards.shield, actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.laser, actionCards.laser,
            actionCards.flaminAce, actionCards.flaminAce,
            actionCards.jerryCan, actionCards.silence,
            actionCards.perro,
        ],
        [kaosCards.high,kaosCards.freeze],
        Enemy.Strat(20,45,90,90,40,2,100)
    ),
    
    dumbass : new Enemy.Create("Dumbass",
        sDumbass, Enemy.Anims(), Enemy.Dialogue(1,"hi"),
        1.5, 2.1, 85,
        [
            actionCards.steak, actionCards.heal,
            actionCards.shield, actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.laser, actionCards.laser,
            actionCards.flaminAce, actionCards.flaminAce,
            actionCards.jerryCan, actionCards.silence,
        ],
        [kaosCards.high,kaosCards.freeze],
        Enemy.Strat(20,45,90,90,40,2,100)
    ),
    
    
    #endregion
};



}