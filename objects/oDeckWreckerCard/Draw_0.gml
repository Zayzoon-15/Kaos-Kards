
//Draw Shadow
drawCardRip(2,ripOneY+8,ripOneAng,0,0,sprite_width,sprite_height/2,c_black,image_alpha*SHADOW_ALPHA,.95,1);
drawCardRip(2,ripTwoY+8,ripTwoAng,0,sprite_height/2,sprite_width,sprite_height/2,c_black,image_alpha*SHADOW_ALPHA,.95,.95);

//Draw Card
drawCardRip(0,ripOneY,ripOneAng,0,0,sprite_width,sprite_height/2);
drawCardRip(0,ripTwoY,ripTwoAng,0,sprite_height/2,sprite_width,sprite_height/2);
