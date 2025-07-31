//Get Info
text = $"Hand:{oDeck.currentCard}/{global.maxHandSize}\nCards in play:{oDeck.cardsInPlay}/{global.maxHandSize}";

//Get Text Size
height = string_height_ext(text,-1,maxWidth);
width = string_width_ext(text,-1,maxWidth);

//Depth
depth = -5;