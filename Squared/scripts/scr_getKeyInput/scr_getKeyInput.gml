/// @function scr_getKeyInput
/// @description gets the current state of the key
/// @argument key unicode value for the key

// set input
var key = argument0;

// return state
if (keyboard_check_pressed(key))
    return (KEY_PRESSED);
else if (keyboard_check(key))
    return (KEY_ISPRESSED);
else if (keyboard_check_released(key))
    return (KEY_RELEASED);
else
    return (KEY_ISRELEASED);
