/// @description Check bullet

if (other.team != -1) {
	hp -= other.dmg;
	instance_destroy(other);
	trigAttacked = true;
	alarm_set(1,trigAttackedReset);
	}
