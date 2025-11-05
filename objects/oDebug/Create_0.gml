
//Function DO NOT TOUCH NO NO
dbgCreateButtons = function(_buttons = [])
{	
	//Create Buttons
	for (var i = 0; i < array_length(_buttons); i++) 
	{
		dbg_button(_buttons[i].string, _buttons[i].action);
	}
}

dbgCreateList = function(_ref,_buttons)
{	
	var _dropInfo = [];
	var _dropName = [];
	for (var i = 0; i < array_length(_buttons); ++i) {
	    array_push(_dropInfo,_buttons[i].info);
	    array_push(_dropName,_buttons[i].name);
	}

	dbg_drop_down(_ref, _dropInfo,_dropName);
}

#region Health Bars


dbg_view("Enemy Bar",false,30,30,250,300);
dbgCreateButtons([
{string:"Shield Effect",action:function(){addEffect(attackEffects.shield,5,true)}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,true);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,true);}},
{string:"Heal",action:function(){healEnemy(20)}},
{string:"Hurt",action:function(){hurtEnemy(20)}},
]);

dbg_view("Player Bar",false,30,30,250,300);
dbgCreateButtons([
{string:"Shield Effect",action:function(){addEffect(attackEffects.shield,5,false)}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,false);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,false);}},
{string:"Heal",action:function(){healPlayer(20)}},
{string:"Hurt",action:function(){hurtPlayer(20)}},
]);

#endregion

//Game Stats
dbg_view("Game Stats",false,30,30,250,300);
dbgCreateButtons([
{string:"Add Mult",action:function(){global.valueMult++;}},
{string:"Remove Mult",action:function(){global.valueMult--;}},
{string:"Reset Mult",action:function(){global.valueMult = 1;}}
]);

//Test Stuff
dbg_view("Test Stuff",false,30,30,250,300);
dbgCreateButtons([
{string:"Bread Attack",action:function(){instance_create_layer(0,0,"Effects",oSwoopBreadAttack)}},
{string:"Arrow",action:function(){instance_create_layer(room_width/2,room_height/2,"Effects",oSwoopChoose)}},
]);

//Rooms
dbg_view("Rooms",false,30,30,250,300);
dbgCreateButtons([
{string:"Prepare Room",action:function(){transStart(rMain);}},
{string:"Enemy Room",action:function(){transStart(rEnemy);}},
]);

var _ref = ref_create(global, "currentEnemy");
dbgCreateList(_ref,[
{name:"Dog",info: enemyInfo.dog},
{name:"Angel",info: enemyInfo.angel},
{name:"Cock",info: enemyInfo.cock},
{name:"Alien",info: enemyInfo.alien},
{name:"Beer",info: enemyInfo.beer},
]);

//Hand
dbg_view("Played Cards",false,30,30,250,300);

dbgCreateButtons([
{string:"Apply",action:function(){
    
    for (var i = 0; i < array_length(oDebug.dbgPlayerAction); i++) {
    	var _info = struct_get_variable(actionCards,oDebug.dbgPlayerAction[i]);
        ds_list_set(playerActions,i,{
            info : _info,
            value : 5
        });
    }
    
    for (var i = 0; i < array_length(oDebug.dbgEnemyAction); i++) {
    	var _info = struct_get_variable(actionCards,oDebug.dbgEnemyAction[i]);
        addEnemyAction(_info,5,i);
    }
    
    ds_debug_print(playerActions,ds_type_list);
    ds_debug_print(enemyActions,ds_type_list);
}},
]);

dbg_section("Player Actions",true);

dbgPlayerAction = [
    ds_list_find_value(playerActions,0),
    ds_list_find_value(playerActions,1),
    ds_list_find_value(playerActions,2), 
];
var _p1 = ref_create(self,"dbgPlayerAction",0);
var _p2 = ref_create(self,"dbgPlayerAction",1);
var _p3 = ref_create(self,"dbgPlayerAction",2);
dbg_text_input(_p1,"First Card");
dbg_text_input(_p2,"Second Card");
dbg_text_input(_p3,"Third Card");

dbg_section("Enemy Actions",true);

dbgEnemyAction = [
    ds_list_find_value(enemyActions,0),
    ds_list_find_value(enemyActions,1),
    ds_list_find_value(enemyActions,2), 
];
var _e1 = ref_create(self,"dbgEnemyAction",0);
var _e2 = ref_create(self,"dbgEnemyAction",1);
var _e3 = ref_create(self,"dbgEnemyAction",2);
dbg_text_input(_e1,"First Card");
dbg_text_input(_e2,"Second Card");
dbg_text_input(_e3,"Third Card");

//Debug Overlay
show_debug_overlay(false);