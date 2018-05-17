/// @description Initialize variables

numberOfStates = 5;
for (i = 0; i < numberOfStates; i += 1) {
	state[i] = false;
	}

team = -1;
trigAttacked = false;

// gravityIncr - the amount to increment the vspeed by when falling
gravityIncr = 0.4;
// gravityMax - the max vertical speed for gravity
gravityMax = 8;
// jumpsMax - the maimum amount of jumps the enemy has
jumpsMax = 1;
// jumps - the amount of jumps the enemy currently has available
jumps = jumpsMax;
// jumpSpeed - the speed to set the vspeed negatively to, when jumping
jumpSpeed = 10;
// delay between jumps 
canJumpDelay = 10;
// If the enemy can jump
canJump = true;
// delay for how long between enemy trying to jump
tryToJumpDelay = 120;
// If the enemy should try to jump
tryToJump = true;
// If the enemy can reverse directions
canReverse = true;
// The delay to reset the enemy reversing directions
canReverseDelay = 70;