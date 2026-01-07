//Target Scale
targetXScale = 16;
targetYScale = 12;

//Menu
currentMenu = "Audio";



swapMenu = function(_menu)
{
	//Juice
	setSize(targetXScale+2,1);
	
	//Name
	currentMenu = _menu;
	
	//Remove Last Ui
	instance_destroy(oParSettingsBox);

	//Get Buttons
	var _buttons = getSettingsButtons(_menu);
	var _totalButtons = array_length(_buttons);
    
    //Grow More
    var _squish = _totalButtons >= 6;
    
	//Create New Ui
	for (var i = 0; i < _totalButtons; ++i) 
	{	
		
		//Get Buttons
	    var _center = y+5;
	    var _height = _squish ? (sprite_get_height(sprite_index)*targetYScale)-40 : 100;
	    var _gap = _squish ? _height/(_totalButtons) : _height;
    
	    var _top = _center - _gap * (_totalButtons-1)/2;
	    var _y = _top + i * _gap;
		
		//Create Button
	    instance_create_depth(x,y,depth-1,_buttons[i].type,
		{
			text : _buttons[i].text,
			targetX : x,
			targetY : _y,
			image_xscale : 1.5,
			image_yscale : .5,
			info : _buttons[i].objectInfo,
		});
	}
	
}