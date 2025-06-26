
currentPage = -1;


nextPage = function()
{
    currentPage ++;
    if currentPage > array_length(pages)-1 {currentPage = 0;}
    currentPage = clamp(currentPage,0,array_length(pages)-1);
    
    instance_destroy(oParTutPage);
    
    instance_create_layer(0,0,"Instances",pages[currentPage]);
}

lastPage = function()
{
    currentPage --;
    if currentPage == -1 {currentPage = array_length(pages);}
    currentPage = clamp(currentPage,0,array_length(pages)-1);
    
    instance_destroy(oParTutPage);
    
    instance_create_layer(0,0,"Instances",pages[currentPage]);
}

pages = [
oTutHands,
oTutSlots,
oTutActions,
oTutDice,
oTutKaos,
oTutBattle
];

nextPage();

//Load Assets
var _tex_array = texturegroup_get_textures("Tutorial");
for (var i = 0; i < array_length(_tex_array); ++i;)
{
    texture_prefetch(_tex_array[i]);
}