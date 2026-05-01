//Draw Top Info
textSetup(fnMain,fa_center,fa_top);
draw_text_transformed(x,10,$"Current Song: {global.curSong}\nLast Song: {global.lastSong}\nSong Loops: {oSound.loops}\nSong Speed: {songSpeed}x",2,2,0);

#region Draw Playhead

//Set Local Vars
var _songLength = global.curSongAudio != noone and audio_is_playing(global.curSongAudio) ? audio_sound_length(global.curSongAudio) : 0;
var _songPos = global.curSongAudio != noone and audio_is_playing(global.curSongAudio) ? audio_sound_get_track_position(global.curSongAudio) : 0;
var _phW = 800;
var _phH = 30;
var _phX = ROOM_CENTER.x;
var _phY = ROOM_CENTER.y + 100;
var _ph1 = new Vector2(_phX - _phW/2,_phY - _phH/2);
var _ph2 = new Vector2(_phX + _phW/2,_phY + _phH/2);

//Draw Bg
drawRectOutlined(_ph1.x,_ph1.y,_ph2.x,_ph2.y);

//Draw Circle Play Head
var _phProgress = global.curSongAudio != noone and audio_is_playing(global.curSongAudio) ? _songPos/_songLength : 0;
var _phCX = _ph1.x + (_phProgress * _phW);
var _phCRad = 25;
draw_circle(_phCX,_phY,_phCRad-5,false);
draw_circle(_phCX,_phY,_phCRad,true);

//Draw Info
textSetup(fnMain,fa_center,fa_middle);
var _phTextSep = 24;
var _phTextPos = new Vector2(_phX,_ph2.y+30);
drawRectOutlined(_phTextPos.x-50,_phTextPos.y-13,_phTextPos.x+50,_phTextPos.y+13);
draw_text_transformed(_phTextPos.x - _phTextSep,_phTextPos.y,$"{_songPos}",1,1,0);
draw_text_transformed(_phTextPos.x,_phTextPos.y,"/",1,1,0);
draw_text_transformed(_phTextPos.x + _phTextSep,_phTextPos.y,$"{_songLength}",1,1,0);


#endregion

#region Draw Typing

//Text Setup
textSetup(fnMain,fa_center,fa_middle);

//Color
var _boxOutline = typing ? 1 : 0;

//Text Stuff
var _boxText = currentText == "" ? "A" : currentText;
var _w = string_width(_boxText)*2;
var _h = string_height(_boxText)*2;
var _boxMargin = 20;

//Box Stuff
var _halfWidth = _w/2;
var _rectRound = UIBOX_RAD;

//Draw The Box
drawRectOutlined(x-_halfWidth-_boxMargin,y-_h-(_boxMargin*2),x+_halfWidth+_boxMargin,y-_h,_rectRound,2,c_black,c_white,UIBOX_ALPHA,_boxOutline);

//Draw Text
draw_text_transformed(x,y-_h-_boxMargin,currentText,2,2,0);

#endregion


#region Draw Controls

textSetup(fnMain,fa_left,fa_bottom);
var _margin = 10;
var _text = "Space To Start Typing\nEnter To Confirm\nCtrl + Backspace To Clear Text\nBackspace To Remove Characters\nUp and down to change song speed";
draw_text_transformed(_margin,SCREEN_HEIGHT-_margin,_text,2,2,0);

#endregion


drawReset();
