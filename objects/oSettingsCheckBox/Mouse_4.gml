
checked = !checked;
image_speed = 1;
image_index = 0;

if struct_exists(info,"action")
{
	info.action(checked);
}