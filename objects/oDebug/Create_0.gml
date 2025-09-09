
dbg_view("Effects",false,30,30,250,300);

buttons = [
{string:"Shield",action:function(){addEffect(attackEffects.shield,10);}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10);}},
{string:"Piss",action:function(){addEffect(attackEffects.pee,10);}},
{string:"Add",action:function(){deceraseAllEffects(-10,false)}},
{string:"Remove",action:function(){deceraseAllEffects(10,false);}},
{string:"Heal",action:function(){healPlayer(10)}},
{string:"Hurt",action:function(){hurtPlayer(10)}},
];

for (var i = 0; i < array_length(buttons); i++) 
{dbg_button(buttons[i].string, buttons[i].action);}

dbg_view("Effects Enemy",false,30,30,250,300);
buttons = [
{string:"Shield",action:function(){addEffect(attackEffects.shield,10,true);}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,true);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,true);}},
{string:"Piss",action:function(){addEffect(attackEffects.pee,10,true);}},
{string:"Add",action:function(){deceraseAllEffects(-10,false)}},
{string:"Remove",action:function(){deceraseAllEffects(10,false);}},
{string:"Heal",action:function(){healEnemy(10)}},
{string:"Hurt",action:function(){hurtEnemy(10)}},
];

for (var i = 0; i < array_length(buttons); i++) 
{dbg_button(buttons[i].string, buttons[i].action);}


dbg_view("Health Bar",true,30,30,250,300);
buttons = [
{string:"Shield",action:function(){global.playerTempHp+=5;}},
{string:"Shield Effect",action:function(){addEffect(attackEffects.shield,5,false)}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,false);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,false);}},
{string:"Heal",action:function(){healPlayer(20)}},
{string:"Hurt",action:function(){hurtPlayer(20)}},
];

for (var i = 0; i < array_length(buttons); i++) 
{dbg_button(buttons[i].string, buttons[i].action);}


show_debug_overlay(true);