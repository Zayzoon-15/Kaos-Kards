

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


show_debug_overlay(false);