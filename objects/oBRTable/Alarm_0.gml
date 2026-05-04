///@desc Destroy Items
with oParBRItem
{
    if !array_contains(global.BRItems,object_index)
    {
        instance_destroy();
    }
}