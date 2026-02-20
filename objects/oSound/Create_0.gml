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