//Icon Hover
tipBoxTouching = point_in_rectangle(mouse_x,mouse_y,bbox_left+10,bbox_top,bbox_left+45,bbox_bottom);
canHover = tipBoxTouching and !instance_exists(oDBSort);
drawTipBox("Right click for sorting options",false,false,10,new Vector2(60,0));

//Set Focused
if touchingMouse() and mouse_check_button_pressed(mb_left)
{
    keyboard_string = text;
    focused = true;
}

if (mouse_check_button_pressed(mb_left) and !touchingMouse()) or keyboard_check_pressed(vk_enter)
{
    focused = false;
}

//Set Text
if focused
{
    //Set Last Text
    lastText = text;
    text = keyboard_string;
    
    //Upper Text
    text = string_upper(text);
    
    //Change Cards
    if lastText != text
    {
        oDBContainer.searchText = text;
        oDBContainer.createCards();
    }
}

//Get Width
draw_set_font(fonts.DBLetter);
var _stringWidth = string_width(text);

//Max Characters
if _stringWidth > (bbox_right-10) - (bbox_left+50)
{
    keyboard_string = string_delete(text,string_length(text),1);
    text = keyboard_string;
}
