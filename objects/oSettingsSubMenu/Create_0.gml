//Set Scissor Value
scissorStuct = {x:0,y:0,w:0,h:0};
updateScissorValue = function()
{
    scissorStuct = {
        x : SCREEN_WIDTH-sprite_width-23, //MAGIC NUMBERS AAAAAAAAAAAAA ~_~
        y : bbox_top,
        w : bbox_right - bbox_left,
        h : bbox_bottom - bbox_top
    }
}

//Scroll
scroll = 0;