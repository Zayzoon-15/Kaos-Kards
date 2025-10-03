
targetXScale = 16;
targetYScale = 12;

currentMenu = "Menu";



swapMenu = function(_menu)
{
	//Juice
	setSize(targetXScale+2,1);
	
	//Name
	currentMenu = _menu;
	
	//Remove Last Ui
	instance_destroy(oParSettingsUi);

	//Get Buttons
	var _buttons = getSettingsButtons(_menu);
	var _totalButtons = array_length(_buttons);
	
	//Create New Ui
	for (var i = 0; i < _totalButtons; ++i) 
	{	
		
		//Get Buttons
	    var _center = y;
	    var _height = 100//(sprite_get_height(sSettingsBg)*targetYScale)-20;
	    var _gap = _height///(_totalButtons);
    
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