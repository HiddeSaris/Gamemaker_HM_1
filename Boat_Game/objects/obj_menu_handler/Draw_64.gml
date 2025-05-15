var gh = display_get_gui_height()
var gw = display_get_gui_width()

draw_set_font(fnt_iflash);

draw_text_transformed(0, 0, "cur_button:  " + string(gw/2), 3, 3, 0)

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_iflash);
draw_set_color(#BCAE72);

draw_text_transformed(gw/2, 100, "BOATY FLOATY", 16, 16, 0);

draw_text_transformed(gw/2, 380, "PLAY", 8, 8, 0);
draw_text_transformed(gw/2+5, 507, "CONTROLS", 8, 8, 0);
draw_text_transformed(gw/2, 635, "QUIT", 8, 8, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);