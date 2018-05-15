/// @description Use left item
if (instance_exists(Player.inventory[1])) {
	if (canFire) {
		with (instance_create_layer(x,y,"instances",obj_bullet)) {
			team = 0;
			dmg = other.Player.inventory[1].dmg;
			range = other.Player.inventory[1].range;
			fireRate = other.Player.inventory[1].fireRate;
			alarm_set(0,range);
			speed = 10;
			direction = point_direction(x,y,mouse_x,mouse_y);
			other.alarm[0] = 60/fireRate;
			}
		canFire = false
		}
	}