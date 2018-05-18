/// @description Check bullet

if (other.team != Player.team) {
	if (other.explosion > 0) {
		var bullet = other;
		with instance_create_layer(x,y,"instances",obj_explosion) {
			team = bullet.team;
			dmg = (bullet.dmg*bullet.explosion/10);
			}
		}
	}

if (other.team != Player.team) {
	hp -= other.dmg;
	instance_destroy(other);
	}