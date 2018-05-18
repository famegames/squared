/// @description Initialize variables

redirect = false;  //Whether or not the bullet should redirect (homing)
alarm_set(1,5);  //Set alarm to make redirect true
correctMax = 15; //How much the bullet will correct itself in homing mode