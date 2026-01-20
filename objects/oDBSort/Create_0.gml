//Drop Down Info
var _dropDown = [
    [
        {text: "Type",action: function(){
            with oDBContainer
            {
                createCards(sorting.type);
            }
        }},
        {text: "Letter",action: function(){
            with oDBContainer
            {
                createCards(sorting.alphabetical);
            }
        }},
        {text: "Date",action: function(){
            with oDBContainer
            {
                createCards(sorting.date);
            }
        }},
    ],
    [
        {text: "All",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.all);
            }
        }},
        {text: "Action",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.action);
            }
        }},
        {text: "Dice",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.dice);
            }
        }},
        {text: "Kaos",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.kaos);
            }
        }},
    ],
]

//Set Vars
var _dist = 120;
var _y = bbox_bottom - 101;
var _xscale = 3;
var _yscale = 1;

//Create Drop Downs
var _inst = noone;
_inst = instance_create_depth(x-_dist,_y,depth-5,oDBSortDropDown,{
    image_xscale : _xscale,
    image_yscale : _yscale,
});
_inst.items = _dropDown[0];
_inst.title = "Sort";

_inst = instance_create_depth(x+_dist,_y,depth-5,oDBSortDropDown,{
    image_xscale : _xscale,
    image_yscale : _yscale,
});
_inst.items = _dropDown[1];
_inst.title = "Type";

//Create Done
instance_create_depth(x,bbox_bottom - 40,depth-5,oDBSortDone,{
    image_xscale : 2,
});