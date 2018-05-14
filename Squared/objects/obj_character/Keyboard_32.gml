/// @description Fire weapon
if (canFire) {
	alarm_set(0,(60/fireRate));
	with (instance_create_layer(x,y,"instances",obj_bullet)) {
		dmg = other.dmg;
		range = other.range;
		alarm_set(0,range);
		speed = 10
		direction = point_direction(x,y,mouse_x,mouse_y);
		}
	canFire = false
	}
