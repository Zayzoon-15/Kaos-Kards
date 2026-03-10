///@desc Favorite Mobile

//Checks
if (instance_place(x,y,oDBCard) and !grabbed) or !canGrab or !global.mobile then exit;

//Juice
image_xscale += .2;
image_yscale += .2;
effectStar(x,y,5);

//Set Favorite
favorite = !favorite;

//Add To Favorite
if favorite
{
    array_push(global.favCards,info);
} else { //Remove From Favorite
    
    var _index = array_get_index(global.favCards,info);
    array_delete(global.favCards,_index,1);
    
}