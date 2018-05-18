/// @description Check Explosion
if (other.team != -1) {
	hp -= other.dmg;
	trigAttacked = true;
	alarm_set(1,trigAttackedReset);
	}
