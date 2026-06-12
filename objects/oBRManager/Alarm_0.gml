///@desc Destroy Items That Don't Belong
with oParBRItem
{
    if !array_contains(global.BRItems,object_index) and object_index != oBRSticky
    {
        instance_destroy();
    }
}