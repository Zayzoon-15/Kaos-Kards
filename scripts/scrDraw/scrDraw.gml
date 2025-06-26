

///@desc Sets the size of the object to the given values
///@arg {real} _x The x scale
///@arg {real} _y The y scale
function setSize(_x,_y)
{
    image_xscale = _x;
    image_yscale = _y;
}


///@desc Creates the info box inst that shows information about the card
///@arg {struct} _struct The struct giving the information required: name, desc, range, boxsize
function showInfoBox(_struct)
{
    var _inst = instance_create_layer(x,bbox_top-50,"Instances",oInfoBox,{
        parent : self,
        info : _struct,
        cardId : self.cardId
    });
    
    return _inst;
    
}


///@desc Draws a tip box above the object when it touches the mouse
///Put the function in a draw Gui event!!!
///@arg {string} _tipText The tip to show
///@arg {real} _boxWidth The width of the box (Default is 60)
///@arg {real} _boxHeight The height of the box (Default is 30)
///@arg {real} _yOffset The y offset of the box (Default is 50)
///@arg {real} _yPos The y pos of the box (Default is bbox_top)
function drawTipBox(_tipText,_boxWidth = 60,_boxHeight = 30, _yOffset = 50,_yPos = bbox_top)
{
    if touchingMouse() and !global.midTrans
    {
        //Box Position
        var _x = x;
        var _y = _yPos - _yOffset;
        
        //Draw Box
        drawBox(_x,_y,_boxWidth,_boxHeight);
        
        //Text Setup
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fnMain);
        
        //Draw Info
        draw_text_transformed(_x,_y,_tipText,1.5,1.5,0);
    }
}

///@desc Draws a message on the screen
///@arg {string} _message The message to show
///@arg {real} _x The x position
///@arg {real} _y The y position
function showMessage(_message,_x = undefined,_y = undefined)
{
    instance_create_layer(0,0,"Ui",oMessage,{
    text : _message,
    xOveride : _x,
    yOveride : _y,

    });
}


///@desc Draws a black box with the given size
///Put the function in a draw event!!!
///@arg {real} _x The x position
///@arg {real} _y The y position
///@arg {real} _boxWidth The width of the box (Default is 60)
///@arg {real} _boxHeight The height of the box (Default is 30)
///@arg {real} _yOffset The y offset of the box (Default is 0)
///@arg {real} _alpha The alpha of the box (Default is .5)
function drawBox(_x,_y,_boxWidth = 60,_boxHeight = 30, _yOffset=0,_alpha=.5)
{
    //Draw Box
    var _boxX = _x-(_boxWidth/2);
    var _boxY = _y-(_boxHeight/2)-_yOffset;
    
    draw_set_alpha(_alpha);
    draw_set_color(c_black);
    draw_rectangle(_boxX-_boxWidth*.5,_boxY-_boxHeight*.5,_boxX+_boxWidth*1.5,_boxY+_boxHeight*1.5,0);
    
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(_boxX-_boxWidth*.5,_boxY-_boxHeight*.5,_boxX+_boxWidth*1.5,_boxY+_boxHeight*1.5,1);
    
}


function drawNumberCountdown(_x,_y,_currentNumber,_isString = false)
{
    instance_create_layer(_x,_y,"Ui",oNumberCount,{
        number : _currentNumber,
        isString : _isString
    });
}




