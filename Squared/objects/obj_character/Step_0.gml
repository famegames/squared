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
		if (object_is_ancestor(object_index,par_upgrade))
			var i = scr_checkArrayUpgrade(other.Player.inventory);
		else
			var i = scr_checkArray(other.Player.inventory);
		if (i <= 11) {
			other.Player.inventory[i] = id;
			x = 0
			y = 0
			image_speed = 0;
			visible = false;
			}
		}
	}

//Check for dying
if (Player.hp < 1) {
	instance_destroy();
	if (not(instance_exists(obj_character))) {
		room_restart();
		var k = 0;
		for (k=0; k<11; k+=1)
			Player.inventory[k] = noone;
		}
	}

//Check for winning
if (not(instance_exists(obj_door))) {
	if (place_meeting(x,y,obj_win))
		room_goto_next();
	}