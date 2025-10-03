///@desc Set Mouse

key = mouse_lastbutton;
selectingKey = false;

//Change Global Var
if struct_exists(info,"key") and !selectingKey
{
	variable_global_set(info.key,key);
}