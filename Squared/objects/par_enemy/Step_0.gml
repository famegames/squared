/// @description Enemy states

//Patrol - Move left and right, bouncing at the end of platform
if (state[0]) {
	if (place_meeting(x+17, y, obj_wall) or place_meeting(x+17, y, obj_wall))
		hspeed = -hspeed;
	if (not place_meeting(x+17, y+17, obj_wall) or not place_meeting(x-17, y+17, obj_wall))
		hspeed = -hspeed;
	}

//Punch when near - If a player is within range, horizontally and vertically, punch that direction
if (state[1]) {
	if (canFire) {
		if((obj_character.y < (y + verticalTol)) and (obj_character.y > (y - verticalTol))) {
			if ((obj_character.x < x) and (obj_character.x > (x - (range*attackSpeed + attackTol)))) {
				with (instance_create_layer(x,y,"instances",obj_bullet)) {
					team = -1;
					dmg = other.dmg;
					range = other.range;
					fireRate = other.fireRate;
					alarm_set(0,range);
					speed = other.attackSpeed;
					direction = 180;
					other.alarm[0] = 60/fireRate;
					}
				canFire = false;
				}
			if ((obj_character.x > x) and (obj_character.x < (x + (range*attackSpeed + attackTol)))) {
				with (instance_create_layer(x,y,"instances",obj_bullet)) {
					team = -1;
					dmg = other.dmg;
					range = other.range;
					fireRate = other.fireRate;
					alarm_set(0,range);
					speed = other.attackSpeed;
					direction = 0;
					other.alarm[0] = 60/fireRate;
					}
				canFire = false;
				}
			}
		}
	}

//Set sprite
if (hspeed > 0)
	image_index = 0;
if (hspeed < 0)
	image_index = 1;
	
//die if dead
if (hp < 1)
	instance_destroy();