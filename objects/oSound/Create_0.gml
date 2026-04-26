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

//Init Songs
initSongs();