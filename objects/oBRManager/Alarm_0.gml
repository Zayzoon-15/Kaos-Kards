///@desc Destroy Items That Don't Belong
with oParBRItem
{
    if !array_contains(global.BRItems,object_index)
    {
        instance_destroy();
    }
}