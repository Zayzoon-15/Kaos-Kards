#region Draw Cards Falling

//Create Surface
var _surface = surface_create(sprite_width-7,sprite_height-5);
surface_set_target(_surface);
draw_clear_alpha(c_black,0);

//Draw Background
draw_set_colour(#403F4C);
draw_rectangle(0,0,surface_get_width(_surface),surface_get_height(_surface),false);

//Draw Cards
draw_sprite_tiled_ext(sSettingsCards,0,cardsOffset.x,cardsOffset.y,1,1,#938DB2,.6);

//Move Cards
cardsOffset.x += .3;
cardsOffset.y += .35;

//Reset Stuff
surface_reset_target();
drawReset();

//Draw Surface
draw_surface(_surface,bbox_left+5,bbox_top+2);
surface_free(_surface);

#endregion

//Draw Box
draw_self();

//Draw Count
textSetup(fnDBNumber,fa_center,fa_middle);
draw_text(x,y,$"{global.deckCardAmount}/{global.currentDeck.maxCards}");

//Reset Draw
drawReset();