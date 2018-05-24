/// @function scr_getMouseName
/// @description takes control key and returns its name
/// @argument key - unicode value for the key

// set input
var key = argument0;

// get name
switch (key) {
    case mb_left:
        return "left click";
    case mb_right:
        return "right click";
    case mb_middle:
        return "middle click";
    default:
        return "";
    }
