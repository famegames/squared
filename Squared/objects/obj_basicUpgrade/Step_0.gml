/// @description Cycle upgrade Id

var upgradeId = image_number;

switch (upgradeId) {
	case 0:
		dmg = 3;
		fireRate = 0;
		range = 0;
		break;
	case 1:
		dmg = 0;
		fireRate = 3;
		range = 0;
		break;
	case 2:
		dmg = 0;
		fireRate = 0;
		range = 3;
		break;
	}