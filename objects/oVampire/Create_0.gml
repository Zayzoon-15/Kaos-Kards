//Shadow
shadowX = 0;
shadowY = 8;
shadowSize = 0.05;

//Drawing
startDepth = depth;

//Mouse
hover = false;
grabbed = false;
offsetX = 0;
offsetY = 0;

//Position
targetX = x;
targetY = y;

//Info
info = struct_copy(kaosCards.vampire);
info.desc = $"{info.desc}[s][lg](Currently active)";

//Target Slot
targetSlotId = 1;