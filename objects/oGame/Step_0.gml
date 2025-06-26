if (keyboard_check(vk_alt) and keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(vk_f11))
{
    global.fullscreen = !global.fullscreen;
}

//Fullscreen
window_set_fullscreen(global.fullscreen);

//Give Upgrades
//Max Hand Size : 10
if global.beatDawg
{
    global.playerHandSize = 6;
    global.discardSpace = 12;
}

if global.beatAngel
{
    global.playerHandSize = 7;
    global.discardSpace = 14;
}

if global.beatBuggy
{
    global.playerHandSize = 8;
    global.discardSpace = 15;
}

if global.beatAlien
{
    global.playerHandSize = 9;
    global.discardSpace = 16;
}

if global.beatBeer
{
    global.playerHandSize = 10;
    global.discardSpace = 17;
}

//Music
//if !instance_exists(oMusicManager)
//{
    //instance_create_layer(0,0,"Effects",oMusicManager);
//}

if room == rMainMenu or room == rEnemySelect
{
    gamestate = GAMESTATE.MENUS;
}
