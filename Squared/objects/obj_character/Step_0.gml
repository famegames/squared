/// @description Input control

// initialize input tracking variables
var haxis = 0;

// local input - temporary!
if (keyboard_check(ord("A")))
	haxis = -1;
if (keyboard_check(ord("D")))
	haxis = 1;
	
if (haxis == -1)
	image_index = 1
if (haxis == 1)
	image_index = 0
	
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

//Picking up items
if (keyboard_check(ord("S"))) {
	with (instance_place(x,y,par_item)) {
		var i = scr_checkArray(other.Player.inventory);
		if (i <= 11) {
			other.Player.inventory[i] = id;
			x = -32
			y = -32
			image_speed = 0;
			}
		}
	}

//Check for dying
if (hp < 1)
	instance_destroy();