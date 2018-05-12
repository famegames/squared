/// @description Input control

// initialize input tracking variables
var haxis = 0;

// local input - temporary!
if (keyboard_check(ord("A")))
	haxis = -1;
if (keyboard_check(ord("D")))
	haxis = 1;

// find current speed
hspeed = haxis*moveSpeed;