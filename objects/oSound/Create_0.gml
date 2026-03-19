//DEBUG
showSongs = false;

//Audio
masterVol = 0;
musicVol = 0;
sfxVol = 0;
voiceVol = 0;

//Current Song
global.curSong = "";
global.curSongAudio = noone;

//Last Song
global.lastSong = "";
global.lastSongAudio = noone;

//Paused
global.songsPaused = ds_map_create();

//Intro
global.songIntrosPlayed = ds_list_create();

//Loops
loops = 0;
loopSongPoint = 0;

//Song Tracks
global.songTracks = ds_map_create();

//Menu
audioCreateSongs("Menu",sgKenu);
audioCreateSongs("Settings",sgKetting);
audioCreateSongs("DeckBuilder1",sgDeckBuilder1,["DeckBuilder2"]);
audioCreateSongs("DeckBuilder2",sgDeckBuilder2,["DeckBuilder1"]);

//Game
audioCreateSongs("Prepare",sgPrepare,["Kaos"],1,3,"PrepareExtended");
audioCreateSongs("PrepareExtended",sgPrepareExtended,["Kaos"],1,1,"Prepare");
audioCreateSongs("Kaos",sgKaos,["Prepare"]);

//Kaos
audioCreateSongs("Retro1",sgRetro1,[],.9);
audioCreateSongs("Retro2",sgRetro2,[],.8);

///Enemies

//Beer
audioCreateSongs("BeerIntro",sgBeerIntro,[],1,1,"BeerPrepare",true,true);
audioCreateSongs("BeerPrepare",sgBeerPrepare,["BeerKaos1","BeerKaos2"]);
audioCreateSongs("BeerKaos1",sgBeerKaos1,["BeerPrepare"],1,2,"BeerKaos2");
audioCreateSongs("BeerKaos2",sgBeerKaos2,["BeerPrepare"],1,2,"BeerKaos1");

//Chud
audioCreateSongs("ChudIntro",sgChudIntro,[],1,1,"ChudPrepare",true,true);
audioCreateSongs("ChudPrepare",sgChudPrepare,["ChudKaos1","ChudKaos2","ChudMini"]);
audioCreateSongs("ChudKaos1",sgChudKaos1,["ChudPrepare","ChudKaos2","ChudMini"],1,2,"ChudKaos2");
audioCreateSongs("ChudKaos2",sgChudKaos3,["ChudPrepare","ChudKaos1","ChudMini"],1,2,"ChudKaos1");
audioCreateSongs("ChudMini",sgChudKaos2,["ChudPrepare","ChudKaos1","ChudKaos2"]);

//Teto
audioCreateSongs("TetoPrepare",sgTetoPrepare,["TetoKaos"],.9);
audioCreateSongs("TetoKaos",sgTetoKaos,["TetoPrepare"],.9);