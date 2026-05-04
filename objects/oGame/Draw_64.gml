//Draw Game Version
if global.showGameVer
{
    textSetup(fnMain,fa_left,fa_bottom);
    draw_text_transformed(8,SCREEN_HEIGHT-7,$"Version {GAMEVER}",1,1,0);
    
    drawReset();
}