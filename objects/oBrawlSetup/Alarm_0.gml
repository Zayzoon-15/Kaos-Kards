///@desc Load Game

//Set Image
image_index = 2;
depth -= 3;

instance_create_layer(x,y,brawlLayerBottom,oBrawlMap);

//Create Characters
instance_create_layer(x,y,brawlLayerTop,oBrawlChar);
instance_create_layer(x,y,brawlLayerTop,oBrawlChar,{playerId : 1});

//Create Bar
instance_create_layer(x,y,brawlLayerTop,oBrawlHp);
instance_create_layer(x,y,brawlLayerTop,oBrawlHp,{playerId : 1});

//Start Count
alarm[1] = 40;