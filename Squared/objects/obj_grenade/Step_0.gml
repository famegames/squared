/// @description Gravity, similar to obj_charcter 
// You can write your code in this editor

// set gravity
if (vspeed < gravityMax){
	vspeed = scr_incrementInBounds(vspeed, gravityIncr, -riseSpeed, gravityMax, false);
	thrown = false;
    }
	
// collide with solid objects
while(!place_free(x+hspeed, y)) {
    hspeed = scr_reduce(hspeed);
    if hspeed = 0 break;
    }
while(!place_free(x+hspeed,y+vspeed)) {
    vspeed = scr_reduce(vspeed);
    if vspeed = 0 {
        break;
        }
    }