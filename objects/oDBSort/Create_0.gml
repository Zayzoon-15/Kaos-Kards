//Drop Down Info
var _dropDown = [
    [
        {text: "Type",action: function(){
            with oDBContainer
            {
                createCards(sorting.type);
                oDBSearchBar.dropDownCurSelection[0] = 0;
            }
        }},
        {text: "Letter",action: function(){
            with oDBContainer
            {
                createCards(sorting.alphabetical);
                oDBSearchBar.dropDownCurSelection[0] = 1;
            }
        }},
        {text: "Date",action: function(){
            with oDBContainer
            {
                createCards(sorting.date);
                oDBSearchBar.dropDownCurSelection[0] = 2;
            }
        }},
    ],
    [
        {text: "All",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.all);
                oDBSearchBar.dropDownCurSelection[1] = 0;
            }
        }},
        {text: "Action",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.action);
                oDBSearchBar.dropDownCurSelection[1] = 1;
            }
        }},
        {text: "Dice",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.dice);
                oDBSearchBar.dropDownCurSelection[1] = 2;
            }
        }},
        {text: "Kaos",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.kaos);
                oDBSearchBar.dropDownCurSelection[1] = 3;
            }
        }},
        {text: "Favs",action: function(){
            with oDBContainer
            {
                createCards(currentSort,types.favs);
                oDBSearchBar.dropDownCurSelection[1] = 4;
            }
        }},
    ],
]

//Set Vars
var _dist = 120;
var _y = bbox_bottom - 101;

//Create Drop Downs
var _inst = noone;
_inst = instance_create_depth(x-_dist,_y,depth-5,oDBSortDropDown);
_inst.items = _dropDown[0];
_inst.title = "Sort";
_inst.selected = dropDownCurSelection[0];

_inst = instance_create_depth(x+_dist,_y,depth-5,oDBSortDropDown);
_inst.items = _dropDown[1];
_inst.title = "Type";
_inst.selected = dropDownCurSelection[1];

//Create Arrow
instance_create_depth(x - 30,_y,depth-5,oDBSortArrow);

//Create Done
instance_create_depth(x,bbox_bottom - 40,depth-5,oDBSortDone);