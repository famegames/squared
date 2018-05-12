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

// jump
if (jumps > 0) {
    if (keyboard_check_pressed(ord("W"))) {
        vspeed = -jumpSpeed;
        jumps -= 1;
        }
    }

// set gravity
if (vspeed < gravityMax)
	vspeed = scr_incrementInBounds(vspeed, gravityIncr, -jumpSpeed, gravityMax, false);

// collide with solid objects
while(!place_free(x+hspeed, y)) {
    hspeed = scr_reduce(hspeed);
    if hspeed = 0 break;
    }
while(!place_free(x+hspeed,y+vspeed)) {
    vspeed = scr_reduce(vspeed);
    if vspeed = 0 {
        //reset jumps
        jumps = jumpsMax;
        break;
        }
    }