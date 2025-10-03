///@desc Set Key

key = keyboard_lastkey;
selectingKey = false;

//Change Global Var
if struct_exists(info,"key") and !selectingKey
{
	variable_global_set(info.key,key);
}