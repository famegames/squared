//Movement

//Local input
if (InputPlayer.inputs[LEFT_KEY]) haxis = -1;
if (InputPlayer.inputs[RIGHT_KEY]) haxis = 1;

//Setting speed
var moveSpeed = 4
hspeed = moveSpeed*haxis