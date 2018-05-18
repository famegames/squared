/// @description draw the text box and title

// draw box
draw_self();

// draw setup
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(fnt_command);

// draw title
draw_text( x,y-28, title);

// draw text
draw_text( x+5,y, text);