///@desc Set Can Pause
canPause = true;

if array_contains(disabledRooms,room) or instance_exists(oGameOver)
{
    canPause = false;
}
