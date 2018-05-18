/// @description Check bullet

if (other.team != -1) {
	if (other.explosion > 0) {
		var bullet = other;
		with instance_create_layer(x,y,"instances",obj_explosion) {
			team = bullet.team;
			dmg = (bullet.dmg*bullet.explosion/10);
			}
		}
	}
	
if (other.team != -1) {
	hp -= other.dmg;
	instance_destroy(other);
	trigAttacked = true;
	alarm_set(1,trigAttackedReset);
	}