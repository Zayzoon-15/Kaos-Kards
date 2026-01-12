///@desc Load Game

//Set Image
image_index = 2;
depth -= 3;

//Create Map
instance_create_layer(x,y,brawlLayerBottom,oBrawlMap);

//Create Characters
instance_create_layer(x,y,brawlLayerTop,oBrawlChar);
instance_create_layer(x,y,brawlLayerTop,oBrawlChar,{playerId : 1});

//Create Bar
instance_create_layer(x,y,brawlLayerTop,oBrawlHp);
instance_create_layer(x,y,brawlLayerTop,oBrawlHp,{playerId : 1});

//Mobile Controls
if global.mobile
{
	instance_create_layer(1168,496,brawlLayerTop,oBrawlMobile,{ //Top Right
		buttonType : "Punch"
	});
	instance_create_layer(976,624,brawlLayerTop,oBrawlMobile,{ //Bottom Right
		buttonType : "Jump"
	});
	instance_create_layer(976,432,brawlLayerTop,oBrawlMobile,{ //Bottom Right
		buttonType : "Block"
	});

	instance_create_layer(112,496,brawlLayerTop,oBrawlMobile,{ //Top Left
		buttonType : "Left"
	});
	instance_create_layer(304,624,brawlLayerTop,oBrawlMobile,{ //Bottom Left
		buttonType : "Right"
	});
}

//Start Count
alarm[1] = 40;