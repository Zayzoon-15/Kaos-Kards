//Set Size
image_xscale = boxW;
image_yscale = boxH;

//Set Position
targetX = instance_exists(playerInst) ? x - playerInst.x : 0;
targetY = instance_exists(playerInst) ? y - playerInst.y : 0;