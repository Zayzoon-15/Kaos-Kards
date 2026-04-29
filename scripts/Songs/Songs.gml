function initSongs() {
    
    #region Menus
    
    //Main Menu
    audioCreateSongs("Menu",sgKenu);
    audioCreateSongs("Settings",sgKetting);
    
    //Deck Builder
    audioCreateSongs("DeckBuilder1",sgDeckBuilder1,["DeckBuilder2"]);
    audioCreateSongs("DeckBuilder2",sgDeckBuilder2,["DeckBuilder1"]);
    
    #endregion
    
    
    #region Game
    
    //Main Game Loop
    audioCreateSongs("Prepare",sgPrepare,["Kaos"],1,1,"PrepareExtended");
    audioCreateSongs("PrepareExtended",sgPrepareExtended,["Kaos"],1,1,"Prepare");
    audioCreateSongs("Kaos",sgKaos,["Prepare"]);
    
    //Break Room
    audioCreateSongs("BreakRoomIntro",sgBreakRoomIntro,[],1.5,1,"BreakRoom",true);
    audioCreateSongs("BreakRoom",sgBreakRoom,[],1.5);
    
    //Shop
    audioCreateSongs("ShopIntro",sgShopIntro,[],1,1,"Shop",true);
    audioCreateSongs("Shop",sgShop,["ShopAfter"]);
    audioCreateSongs("ShopAfter",sgShopAfter,["Shop"]);
    
    //Retro Brawler Card
    audioCreateSongs("Retro1",sgRetro1,[],.9);
    audioCreateSongs("Retro2",sgRetro2,[],.8);
    
    #endregion
    
    
    #region Enemies
    
    //Beer
    audioCreateSongs("BeerIntro",sgBeerIntro,[],1,1,"BeerPrepare",true);
    audioCreateSongs("BeerPrepare",sgBeerPrepare,["BeerKaos1","BeerKaos2"]);
    audioCreateSongs("BeerKaos1",sgBeerKaos1,["BeerPrepare"]);
    audioCreateSongs("BeerKaos2",sgBeerKaos2,["BeerPrepare"]);
    
    //Chud
    audioCreateSongs("ChudIntro",sgChudIntro,[],1,1,"ChudPrepare",true);
    audioCreateSongs("ChudPrepare",sgChudPrepare,["ChudKaos1","ChudKaos2","ChudMini"]);
    audioCreateSongs("ChudKaos1",sgChudKaos1,["ChudPrepare","ChudMini"]);
    audioCreateSongs("ChudKaos2",sgChudMini,["ChudPrepare","ChudMini"]);
    audioCreateSongs("ChudMini",sgChudKaos2,["ChudPrepare","ChudKaos1","ChudKaos2"]);
    
    //Teto
    audioCreateSongs("TetoPrepare",sgTetoPrepare,["TetoKaos"],.9);
    audioCreateSongs("TetoKaos",sgTetoKaos,["TetoPrepare"],.9);
    
    #endregion
    
    
}