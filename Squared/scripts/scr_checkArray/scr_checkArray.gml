/// @function real = scr_checkArray()
/// @description Checks an array for the first empty index

for (i = 0; i < 11; i += 1) {
	if (inventory[i] == noone) {
		return i
		}
	}