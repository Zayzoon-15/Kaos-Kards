//Fullscreen
if keyCheckPressed(global.keyFullscreen)
{
	window_set_fullscreen(!window_get_fullscreen());
}

#region Clamp Health

global.playerHp = floor(global.playerHp);
global.playerTempHp = floor(global.playerTempHp);
global.enemyHp = floor(global.enemyHp);
global.enemyTempHp = floor(global.enemyTempHp);
global.playerHp = clamp(global.playerHp,0,100);
global.playerTempHp = clamp(global.playerTempHp,0,100);
global.enemyHp = clamp(global.enemyHp,0,100);
global.enemyTempHp = clamp(global.enemyTempHp,0,100);

#endregion
