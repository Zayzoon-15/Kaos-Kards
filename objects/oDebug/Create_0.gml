
dbg_view("Enemy Bar",false,30,30,250,300);
buttons = [
{string:"Shield Effect",action:function(){addEffect(attackEffects.shield,5,true)}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,true);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,true);}},
{string:"Heal",action:function(){healEnemy(20)}},
{string:"Hurt",action:function(){hurtEnemy(20)}},
];

for (var i = 0; i < array_length(buttons); i++) 
{dbg_button(buttons[i].string, buttons[i].action);}


dbg_view("Player Bar",false,30,30,250,300);
buttons = [
{string:"Shield Effect",action:function(){addEffect(attackEffects.shield,5,false)}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10,false);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10,false);}},
{string:"Heal",action:function(){healPlayer(20)}},
{string:"Hurt",action:function(){hurtPlayer(20)}},
];

for (var i = 0; i < array_length(buttons); i++) 
{dbg_button(buttons[i].string, buttons[i].action);}

show_debug_overlay(false);