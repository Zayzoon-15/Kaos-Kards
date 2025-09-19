
//Function DO NOT TOUCH NO NO
createView = function(_name,_buttons = [], _showMenu = false)
{
	dbg_view(_name,_showMenu,30,30,250,300);
	for (var i = 0; i < array_length(_buttons); i++) 
	{dbg_button(_buttons[i].string, _buttons[i].action);}
}

#region Health Bars

createView("Enemy Bar",[
{string:"Shield Effect",action:function(){addEffect(attackEffects.shield,5,true)}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,true);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,true);}},
{string:"Heal",action:function(){healEnemy(20)}},
{string:"Hurt",action:function(){hurtEnemy(20)}},
]);

createView("Player Bar",[
{string:"Shield Effect",action:function(){addEffect(attackEffects.shield,5,false)}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,false);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,false);}},
{string:"Heal",action:function(){healPlayer(20)}},
{string:"Hurt",action:function(){hurtPlayer(20)}},
]);

#endregion

//Game Stats
createView("Game Stats", [
{string:"Add Mult",action:function(){global.valueMult++;}},
{string:"Remove Mult",action:function(){global.valueMult--;}},
{string:"Reset Mult",action:function(){global.valueMult = 1;}}
]);

//Test Stuff
createView("Test Stuff", [
{string:"Bread Attack",action:function(){instance_create_layer(0,0,"Effects",oBreadKaosAttack)}},
{string:"Arrow",action:function(){instance_create_layer(room_width/2,room_height/2,"Effects",oSwoopChoose)}},
],true);

//Debug Overlay
show_debug_overlay(true);