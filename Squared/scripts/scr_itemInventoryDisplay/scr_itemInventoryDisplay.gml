/// @function scr_itemInventoryDisplay
/// @description have the item display its inventory icon in the designated position
/// @argument item instance id
/// @argument x x-coordinate
/// @argument y y-coordinate

// draw the item
with (argument0)
{
	// set the display coordinates for drawing
	displayX = argument1;
	displayY = argument2;
	
	// have item display
	event_user(0);
}