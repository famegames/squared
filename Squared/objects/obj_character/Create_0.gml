/// @description Initialize character variables

// moveSpeed - the speed of the character
moveSpeed = 4;

// gravityIncr - the amount to increment the vspeed by when falling
gravityIncr = 0.4;
// gravityMax - the max vertical speed for gravity
gravityMax = 10;

// jumpsMax - the maimum amount of jumps the character has
jumpsMax = 1;
// jumps - the amount of jumps the player currently has available
jumps = jumpsMax;
// jumpSpeed - the speed to set the vspeed negatively to, when jumping
jumpSpeed = 6;

// Player - instance id of the controlling player
Player = noone;

//Animation
image_speed = 0