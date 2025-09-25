
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
	
	//Setup Grid
	var _cols = 2;
	var _cellW = sprite_width/_cols;
	var _cellH = 120;
	var _rows = ceil(_totalButtons / _cols);
	var _gridWidth  = (_cols - 1) * _cellW;
	var _gridHeight = (_rows - 1) * _cellH;
	var _startX = x - _gridWidth * 0.5;
	var _startY = y - _gridHeight * 0.5;
	var _rowsTaken = 0;
	
	//Create New Ui
	for (var i = 0; i < _totalButtons; ++i) 
	{	
		//Get Position
	    var _buttonCollum = i mod _cols;
	    var _buttonRow = ((i+_rowsTaken) div _cols);
	    var _x = _startX + _buttonCollum * _cellW;
	    var _y = _startY + _buttonRow * _cellH;
		if _buttons[i].takeRow
		{
			//Set X Pos
			_x = x;	
			
			//Get New Y Pos
			var _newRow = _buttonRow;
			_y = _startY + _newRow * _cellH;
			
			//Increase Rows
			_rowsTaken += 1;
		}
		
		//Create Button
	    instance_create_depth(x,y,depth-1,_buttons[i].type,
		{
			text : _buttons[i].text,
			targetY : _y,
			targetX : _x-x,
			col : _buttonCollum,
			image_xscale : 1.5,
			image_yscale : .5,
			info : _buttons[i].objectInfo,
		});
	}
	
}