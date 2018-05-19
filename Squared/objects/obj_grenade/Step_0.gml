/// @description Gravity, similar to obj_charcter 
// You can write your code in this editor

// set gravity
if (vspeed < gravityMax && thrown == true)
	vspeed = scr_incrementInBounds(vspeed, gravityIncr, -riseSpeed, gravityMax, false);
