/// @description Enemy states

//Patrol - Move left and right, bouncing at the end of platform
if (state[0]) {
	if (place_meeting(x+17, y, obj_wall) or place_meeting(x+17, y, obj_wall))
		hspeed = -hspeed;
	if (not place_meeting(x+17, y+17, obj_wall) or not place_meeting(x-17, y+17, obj_wall))
		hspeed = -hspeed;
	}

//Set sprite
if (hspeed > 0)
	image_index = 0;
if (hspeed < 0)
	image_index = 1;