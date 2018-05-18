/// @description multishot delay
with (instance_create_layer(x,y-12,"instances",obj_bullet)) {
	team = 0;
	dmg = other.dmg;
	range = other.range;
	fireRate = other.fireRate;
	homingLevel = other.homingLevel;
	multishot = other.multishot - 1;
	if (multishot > 0)
		alarm_set(2,1);
	explosion = other.explosion;
	alarm_set(0,range);
	speed = 10;
	direction = other.direction;
	}
