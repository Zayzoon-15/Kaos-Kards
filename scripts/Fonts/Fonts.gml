function initFonts(){
    
    //Create Fonts
    globalvar fonts;
    fonts = {
        
        //Numbers
        number : font_add_sprite_ext(sNumbers,"0123456789+-",true,0),
        numberOutline : font_add_sprite_ext(sNumbersOutlined,"0123456789+-",true,0),
        
        //Deck Builder
        DBLetter : font_add_sprite_ext(sDBLetters,"ABCDEFGHIJKLMNOPQRSTUVWXYZ|:",true,0),
        DBNumber : font_add_sprite_ext(sDBNumbers,"/0123456789",true,0),
        
        //Trophy Room
        TRNumber : font_add_sprite_ext(sTRFont, "0123456789", true, -3),
        
        //Break Room
        BRSpeaker : font_add_sprite_ext(sBRSpeakerFont,"ABCDEFGHIJKLMNOPQRSTUVWXYZ !",true,-.5),
        BRThink : font_add_sprite_ext(sBRThinkFont,"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz ,.!?",true,0),
    };
    
}