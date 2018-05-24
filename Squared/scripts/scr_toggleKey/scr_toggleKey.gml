/// @function scr_toggleKey
/// @description toggle key from PRESSED to ISPRESSED
/// @argument key key to toggle

// set inputs
var value = argument0;

//start
if (value == KEY_PRESSED) return(KEY_ISPRESSED);
if (value == KEY_RELEASED) return(KEY_ISRELEASED);
else return(KEY_ISRELEASED);