///@desc Receive Message
broadcastSprite("slashDamage",action,true);
broadcastSprite("slashCharge",function() {
  currentlyDamaging = true;  
},true);