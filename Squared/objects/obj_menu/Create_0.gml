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
// inputFreeze - small amount of time inbetween menu switches
inputFreeze = 0;
// inputFreezeMax
inputFreezeMax = 4;

/// set player variables
players = ds_list_create();
// teams - the player's team
teams = ds_list_create();
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