///@desc Load Game

//Set Image
image_index = 2;
depth -= 3;

//Create Characters
instance_create_layer(x,y,brawlLayerTop,oBrawlChar);
instance_create_layer(x,y,brawlLayerTop,oBrawlChar,{playerId : 1});

//Create Bar
instance_create_layer(x,y,brawlLayerTop,oBrawlHp);
instance_create_layer(x,y,brawlLayerTop,oBrawlHp,{playerId : 1});

//Mobile Controls
if global.mobile
{
	instance_create_layer(974,519,brawlLayerTop,oBrawlMobile,{ //Top Right
		buttonType : "Punch"
	});
	instance_create_layer(1145,626,brawlLayerTop,oBrawlMobile,{ //Bottom Right
		buttonType : "Jump"
	});
	instance_create_layer(1167,455,brawlLayerTop,oBrawlMobile,{ //Bottom Right
		buttonType : "Block"
	});

	instance_create_layer(200,545,brawlLayerTop,oBrawlMobile,{ //Top Left
		buttonType : "Left"
	});
	instance_create_layer(395,545,brawlLayerTop,oBrawlMobile,{ //Bottom Left
		buttonType : "Right"
	});
}

//Start Count
alarm[1] = 40;