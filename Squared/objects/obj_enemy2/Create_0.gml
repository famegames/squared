/// @description Initialize variables

// Inherit the parent event
event_inherited();

// You can write your code in this editor
state[1] = true;
state[3] = true;
canFire = true;

image_index = 0
image_speed = 0

//Initialize enemy variables
enemySpeed = 4;
hp = 25;
dmg = 5;
range = 20;
fireRate = 4;
attackSpeed = 8;
attackTol = 48;  //Number of pixels away after range*attackSpeed the enemy must be before attacking
verticalTol = 64; //Number of pixels above or below the player must be before attacking
trigAttackedReset = 30;  //Number of steps to perform trigAttacked action