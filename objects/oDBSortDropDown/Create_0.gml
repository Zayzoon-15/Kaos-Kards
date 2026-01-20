//Items
title = "Item List";
items = [
    {
        text : "Item 1",
        action : function(){
            print("PRESSED");
        },
    },
    {
        text : "Item 2",
        action : function(){
            print("PRESSED");
        },
    },
    {
        text : "Item 3",
        action : function(){
            print("PRESSED");
        },
    },
];

//List Size
itemH = sprite_height;
listH = 0;
listW = 0;
listScale = 0;
open = false;

//Hover
hover = undefined;
lastHover = undefined;

//Pressed
pressed = false;
pressedItem = false;
selected = 0;

//Animation
animPos = 0;