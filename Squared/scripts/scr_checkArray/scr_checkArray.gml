/// @function real = scr_checkArray(array)
/// @description Checks an array for the first empty index
/// @argument array The inventory array from player

var array = argument0;

for (i = 0; i < 11; i += 1) {
	if (array[i] == noone) {
		return i
		}
	}

return 12;