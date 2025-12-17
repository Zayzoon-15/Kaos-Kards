
xPos = CAMERA_POS.x - 100;
yPos = CAMERA_POS.y - 100;
stickers = [];

createStickers = function()
{
	xPos = CAMERA_POS.x - 100;
	yPos = CAMERA_POS.y - 100;
	stickers = [];

	while xPos <= SCREEN_WIDTH + 100
	{
		var _sticky = instance_create_layer(0,0,layer,oSticker);
	
		_sticky.x = xPos;
		_sticky.y = yPos;
		xPos += _sticky.sprite_width * 0.5;
	
		if xPos >= SCREEN_WIDTH + 100 and yPos <= SCREEN_HEIGHT
		{
			xPos = CAMERA_POS.x - 100;
			yPos += random_range(70,120);
		}

		array_push(stickers,_sticky);
	}

	array_shuffle(stickers);

	//Last Sticker
	var _lastSticker = instance_create_layer(0,0,layer,oSticker);
	_lastSticker.x = ROOM_CENTER.x;
	_lastSticker.y = ROOM_CENTER.y;
	_lastSticker.depth -= 10;
	_lastSticker.image_angle = 0;
	array_push(stickers,_lastSticker);	
	
}

removeStickers = function()
{	
	for (var i = array_length(stickers)-1; i >= 0; i--) {
	    if i == array_length(stickers)-1
		{
			stickers[i].alarm[1] = 1;
		} else stickers[i].alarm[1] = random_range(2,30);
	}
}


startStickerTrans = function()
{
	//Create Stickers
	createStickers();

	//Show Stickers
	for (var i = 0; i < array_length(stickers); ++i) {
	    if stickers[i] != stickers[array_length(stickers)-1]
		{
			stickers[i].alarm[0] = random_range(1,30);
		} else stickers[i].alarm[0] = 33;
	}

	//Start Transition
	timeSourceCreate(1.5,function()
	{
		//Change Room
		room_goto(global.roomTarget);
	
		//Destroy Stickers
		removeStickers();
	});
	
	//Set Transition
	timeSourceCreate(2,function(){
		global.midTrans = false;
		instance_destroy();
	});
}

//Transition
startStickerTrans();