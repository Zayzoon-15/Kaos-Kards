///@desc Enemy Ai Choice

///At somepoint the ai will be actually smart but for now it's random

//Randomise
randomise();

//Move
var _dir = choose(-1,1,1,1);
if _dir == -1
{
	keyLeft = 1;
	keyRight = 0;
} else
{
	keyLeft = 0;
	keyRight = 1;
}

//Jump
if irandom_range(1,4) == 1
{
	actJump();
}

//Punch
if irandom_range(1,2) == 1
{
	actPunch();
}