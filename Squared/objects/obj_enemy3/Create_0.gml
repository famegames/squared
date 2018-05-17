/// @description Initialize variables

// Inherit the parent event
event_inherited();

// You can write your code in this editor
state[3] = true;
state[4] = true;
canFire = true;

image_index = 0
image_speed = 0

//Initialize enemy variables
startingSpeed = 5;
enemySpeed = startingSpeed;
hp = 35;
dmg = 6;
range = 15;
fireRate = 5;
attackSpeed = 10;
attackTol = 48;  //Number of pixels away after range*attackSpeed the enemy must be before attacking
verticalTol = 64; //Number of pixels above or below the player must be before attacking
trigAttackedReset = 20;  //Number of steps to perform trigAttacked action