//Draw Self
draw_self();

//Draw Trophy Icon
draw_sprite(sTRTrophyIcon, 0, x+100, y-50);

//Make the value reformat from "0" to "0000" etc.
var formattedString = string(67); // <----- using the string function so it's easy to replace with an int variable or something in the future
while (string_length(formattedString) < 4) {
    formattedString = "0" + formattedString;
}

//Draw Text
textSetup(fnTRNumber, fa_center, fa_middle, c_white, image_alpha);
draw_text_transformed(x+54, y-15, formattedString, 1, 1, 0);