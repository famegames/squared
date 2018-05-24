/// @description Initiate menus

// Main - global refernce variable
global.Menu = id;

// globals
// onnline - whether the game is being played online
global.online = false;

// state macros
#macro STATE_MAIN 0
#macro STATE_LOBBY 1
#macro STATE_GAME 2
#macro STATE_SCORE 3
#macro STATE_ONLINE 4

// state - the current state of the game
state = STATE_MAIN;

// buttons - list of all buttons on the current menu
buttons = ds_list_create();

// input
// selectedButton - the currently selected button using keyboard input
selectedButton = 0;
// inputBuffer - small buffer to slow down gamepad input
inputBuffer = 0;
// inputBufferMax
inputBufferMax = 4;
// inputFreeze - small amount of time inbetween menu switches
inputFreeze = 0;
// inputFreezeMax
inputFreezeMax = 4;

/// set player variables
players = ds_list_create();
// teams - the player's team
teams = ds_list_create();
// teamMax - the max amount of teams
teamMax = 1;
// names - name of the player
names = ds_list_create();
// readys - if player is ready
readys = ds_list_create();
// localControls - list holding which local players are in
localControls = ds_list_create();

// localPlayers - hold all the local player input objects
localPlayers = ds_map_create();

// initiate the main menu
scr_menuInitMain();

/// Server
// list to hold data for different menus, lobby
serverData = ds_list_create();

/// Controls
// controls - global array holding the unicode value for each key
var player = 0;
global.controls[player, LEFT_KEY] = vk_left;
global.controls[player, RIGHT_KEY] = vk_right;
global.controls[player, UP_KEY] = vk_up;
global.controls[player, DOWN_KEY] = vk_down;
global.controls[player, ACTION_KEY] = vk_numpad0;         // jump
global.controls[player, ACTION2_KEY] = vk_numpad3;   // selection
global.controls[player, LEFTSELC_KEY] = vk_numpad1;  // ice
global.controls[player, RIGHTSELC_KEY] = vk_numpad2; // fire
global.controls[player, KEY_TYPE] = CONTROLS_KEYBOARD;