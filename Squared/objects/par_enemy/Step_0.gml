/// @description Enemy states

//Find nearest player
if (instance_exists(obj_character)) {
	var NearestPlayer = instance_nearest(x,y,obj_character);
	distanceToPlayer = distance_to_point(NearestPlayer.x,NearestPlayer.y);
	}

if (state[0]) {
	hspeed = 0;
	vspeed = 0;
	}
	
//Patrol - Move left and right, bouncing at the end of platform
if (state[1]) {
	if (hspeed = 0)
		hspeed = enemySpeed;
	if (place_meeting(x+17+enemySpeed, y, obj_wall) or (not place_meeting(x+17+enemySpeed, y+17, obj_wall)))
		hspeed = -enemySpeed;
	if (place_meeting(x-17-enemySpeed, y, obj_wall) or (not place_meeting(x-17-enemySpeed, y+17, obj_wall)))
		hspeed = enemySpeed;
	}

//Punch when near - If a player is within range, horizontally and vertically, punch that horizontal direction
if (state[2]) {
	if (canFire) {
		if (instance_exists(obj_character)) {
			if((NearestPlayer.y < (y + verticalTol)) and (NearestPlayer.y > (y - verticalTol))) {
				if ((NearestPlayer.x < x) and (NearestPlayer.x > (x - (range*attackSpeed + attackTol)))) {
					with (instance_create_layer(x,y,"instances",obj_bullet)) {
						team = other.team;
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
				if ((NearestPlayer.x > x) and (NearestPlayer.x < (x + (range*attackSpeed + attackTol)))) {
					with (instance_create_layer(x,y,"instances",obj_bullet)) {
						team = other.team;
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
	}

//Shoot when near - If a player is within range, horizontally and vertically, shoot towards the player
if (state[3]) {
	if (canFire) {	
		if (instance_exists(obj_character)) {
			if (distanceToPlayer <= (range*attackSpeed + attackTol)) {
				with (instance_create_layer(x,y,"instances",obj_bullet)) {
					team = other.team;
					dmg = other.dmg;
					range = other.range;
					fireRate = other.fireRate;
					alarm_set(0,range);
					speed = other.attackSpeed;
					direction = point_direction(other.x,other.y,NearestPlayer.x,NearestPlayer.y);
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