debugMode = false;
show_debug_overlay(debugMode);

//FOR NOW SAVE DEBUG KEY
ini_open("Settings.sav");
global.keyDebug = ini_read_real("Settings","debug",220);
ini_close();