function initEnemyinfo()
{

//Setup Functions
EnemyEffects();
Enemy();


globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    ///--- MAIN CREW ---///
    #region
    
    dog : new Enemy.Create("Dog the Duck",
        sDog, Enemy.Anims(2,2,2,2,2), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1
    ),
    
    cock : new Enemy.Create("Cock the Bug",
        sCock, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1
    ),
    
    angel : new Enemy.Create("Angel the Juvenile",
        sAngel, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1
    ),
    
    alien : new Enemy.Create("Alan the Alien",
        sAlien, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1
    ),
    
    ///--- BOSS ---///
    beer : new Enemy.Create("Beer the Pickle", 
        sBeer, Enemy.Anims(), Enemy.Dialogue(10,"Bitch"),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1
    ),
    
    #endregion
    
    
    ///--- RETRO CREW ---///
    #region
    
    handsy : new Enemy.Create("Handsy the Hand",
        sHandsy, Enemy.Anims(), Enemy.Dialogue(5,"Wah wah wah, wah wah wah wah >:)","Wah wah wah! >:D","Wah wah... :("),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1
    ),
    
    ///--- BOSS ---///
    chud : new Enemy.Create("Ichiro Uzumaki the Chud",
        sChud, Enemy.Anims(2,2,2,2,4,{
            kaosHotDogStart: Enemy.AnimClip(8,13,false,"idle"),
            kaosHotDogLose : Enemy.AnimClip(21,3,true)
        }), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1),
    
    #endregion
    
    
    ///--- SPOOKY CREW ---///
    #region
    
    bones : new Enemy.Create("Jones the Living Bones",
        sBones, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1),
    
    
    #endregion
    
    
    ///--- CAMEOS ---///
    #region
    
    teto : new Enemy.Create("Kasane Teto the UTAU",
        sTeto, Enemy.Anims(2,2,2,2,2), Enemy.Dialogue(5,["Man, FUCK Complex bro","MAN FUCK YOU","MMMMM Bread..."]),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1),
    
    jsg : new Enemy.Create("Just Some Guy",
        sJsg, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1
    ),
    
    pug : new Enemy.Create("Loulou the Pug",
        sPug, {idle : Enemy.AnimClip(0,41,true)}, Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1),
    
    fungi : new Enemy.Create("Fungi",
        sFungi, {idle : Enemy.AnimClip(0,59,true)}, Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1),
    
    bf : new Enemy.Create("Boyfriend From Fnf",
        sWoah, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1),
    
    rod : new Enemy.Create("John Rod",
        sRod, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            CardsAction.Heal
        ],
        [CardsKaos.Swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [CardsAction.Heal],
        [], [], 1),
    
    
    #endregion
};



}