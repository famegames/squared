/// @fucntion scr_getInputName
/// @description takes control key and returns its name
/// @argument code unicode value for the key
/// @argument control the control key
/// @argument controller the controller type, keyboard, mouse, etc

// set input
var code = argument0;
var control = argument1;
var controller = argument2;

// get name
switch (controller) {
    case CONTROLS_KEYBOARD:
        return(scr_getKeyName(code));
    case CONTROLS_MOUSE:
        if (control < ACTION2_KEY)
            return(scr_getKeyName(code));
        else 
            return(scr_getMouseName(code));
    }