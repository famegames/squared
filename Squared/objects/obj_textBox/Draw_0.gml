/// @description draw the text box and title

// draw box
draw_self();

// draw setup
draw_set_color(c_white);
draw_set_font(fnt_button);

// draw title
draw_set_halign(fa_middle);
draw_text(x, y-28, title);

// draw text
draw_set_halign(fa_left);
draw_text(x+5-sprite_width/2, y, text);

// draw cursor
if (selected)
{
	// dx - draw x
	var dx = x + string_width(text) - sprite_width/2 + 6;
	// sh - string height
	var sh = string_height(text);
	
	// draw cursor
	draw_line(dx, y-sh/2, dx, y+sh/2);
}