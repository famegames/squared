/// @description Draw button

// draw sprite
draw_self();

// set up drawing
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(fnt_button);

// draw title
if (title != "")
	draw_text(x, y, title);
else
	draw_text(x, y, action);