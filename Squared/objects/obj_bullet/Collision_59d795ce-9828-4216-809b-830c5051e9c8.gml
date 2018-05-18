/// @description Destroy self
if (explosion > 0) {
	with instance_create_layer(x,y,"instances",obj_explosion) {
		team = other.team;
		dmg = (other.dmg*other.explosion/10);
		}
	}
instance_destroy();