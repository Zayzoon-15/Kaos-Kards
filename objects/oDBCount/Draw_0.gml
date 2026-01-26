//Draw Box
draw_self();

//Draw Count
textSetup(fnMain,fa_center,fa_middle);
draw_text(x,y,$"{global.deckCardAmount}/{global.currentDeck.maxCards}");