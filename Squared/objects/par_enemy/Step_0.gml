/// @description Enemy states

//Set a random value
randomize();

//Find nearest player
if (instance_exists(obj_character)) {
	var NearestPlayer = instance_nearest(x,y,obj_character);
	distanceToPlayer = distance_to_point(NearestPlayer.x,NearestPlayer.y);
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

if (state[0]) {
	hspeed = 0;
	}
	
//Patrol - Move left and right, bouncing at walls or the end of platform
if (state[1]) {
	if (hspeed = 0)
		hspeed = enemySpeed;
	if (place_meeting(x+hspeed, y, obj_wall) or (not place_meeting(x+sign(hspeed)*32+hspeed, y+8, obj_wall)))
		hspeed = -hspeed;
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
						homingLevel = other.homingLevel;
						multishot = other.multishot;
						explosion = other.explosion;
						alarm_set(0,range);
						speed = other.attackSpeed;
						direction = 180;
						other.alarm[0] = fireRate;
						}
					canFire = false;
					}
				if ((NearestPlayer.x > x) and (NearestPlayer.x < (x + (range*attackSpeed + attackTol)))) {
					with (instance_create_layer(x,y,"instances",obj_bullet)) {
						team = other.team;
						dmg = other.dmg;
						range = other.range;
						fireRate = other.fireRate;
						homingLevel = other.homingLevel;
						multishot = other.multishot;
						explosion = other.explosion;
						alarm_set(0,range);
						speed = other.attackSpeed;
						direction = 0;
						other.alarm[0] = fireRate;
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
					homingLevel = other.homingLevel;
					multishot = other.multishot;
					explosion = other.explosion;
					alarm_set(0,range);
					speed = other.attackSpeed;
					direction = point_direction(other.x,other.y,NearestPlayer.x,NearestPlayer.y);
					other.alarm[0] = fireRate;
					}
				canFire = false;
				}
			}
		}
	}

//Random Jump - Enemy randomly jumps, might jump at end of platforms and reverses directions
if (state[4]) {
	if (hspeed == 0)
		hspeed = enemySpeed;
	if (place_meeting(x+hspeed, y+vspeed, obj_wall))
		hspeed = -hspeed;
	//Edge of platform
	if (place_meeting(x-hspeed,y+8,obj_wall) and (not place_meeting(x+sign(hspeed)*32+hspeed, y+8, obj_wall))) {
		if (jumps > 0) {
			if (canJump = true) {
				if (irandom(9) < 9) {
				    vspeed = -jumpSpeed;
				    jumps -= 1;
				    }
				canJump = false;
				alarm_set(2,canJumpDelay);
			}
		}
	}
	if (tryToJump) {
		if(jumps > 0) {
			if (irandom(2) == 0) {
				vspeed = -jumpSpeed;
				jumps -= 1;
				}
			tryToJump = false;
			alarm_set(3,tryToJumpDelay)
			}
		}
	if (canReverse) {
		if (irandom(2) == 0)
			hspeed = -hspeed;
		canReverse = false;
		alarm_set(4,canReverseDelay);
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