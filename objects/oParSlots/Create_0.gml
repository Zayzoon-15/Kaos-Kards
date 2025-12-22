//Stats
filled = false;
used = false;
disabled = false;

//Image
scale = 1;
image_index = 0;

//Type
targetType1 = CARDTYPES.ACTION;
targetType2 = undefined;

//Card
card = noone;

//Check If Disabled
var _slot = global.disabledSlots.player[slotId];
if room == rEnemy then _slot = global.disabledSlots.enemy[slotId];
disabled = _slot;

//Sound
if disabled then audioPlaySfx(snFreeze,.95,1.05);