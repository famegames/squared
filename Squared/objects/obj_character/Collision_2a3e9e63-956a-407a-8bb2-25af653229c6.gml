/// @description Check bullet

if (other.team != Player.team) {
	hp -= other.dmg;
	instance_destroy(other);
	}