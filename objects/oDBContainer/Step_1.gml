//Update
updateScissorValue();


//Text
if keyboard_check(vk_control)
{
    //Sort
    if keyboard_check_pressed(ord("Q")) then createCards(sorting.type);
    if keyboard_check_pressed(ord("A")) then createCards(sorting.alphabetical);
    
    //Type
    if keyboard_check_pressed(ord("Z")) then createCards(currentSort,types.all);
    if keyboard_check_pressed(ord("X")) then createCards(currentSort,types.action);
    if keyboard_check_pressed(ord("C")) then createCards(currentSort,types.dice);
    if keyboard_check_pressed(ord("V")) then createCards(currentSort,types.kaos);
}