/// @description Upgrades

var canTarget = false;

if (team < 0) {
	if (instance_exists(obj_character)) {
		var NearestTarget = instance_nearest(x,y,obj_character);
		distanceToTarget = distance_to_point(NearestTarget.x,NearestTarget.y);
		canTarget = true;
		}
	}
else {
	if (instance_exists(par_enemy)) {
		var NearestTarget = instance_nearest(x,y,par_enemy);
		distanceToTarget = distance_to_point(NearestTarget.x,NearestTarget.y);
		canTarget = true;
		}
	}


if (homingLevel > 0) {
	if (canTarget) {
		if (redirect) {
			correctDirection = point_direction(x,y,NearestTarget.x,NearestTarget.y);
			correction = correctDirection - direction;
			if (abs(correction) < correctMax)
				direction = correctDirection;
			else
				direction = (direction + (sign(correction)*correctMax));
			alarm_set(1,(4/homingLevel));
			redirect = false;
			}
		}
	}