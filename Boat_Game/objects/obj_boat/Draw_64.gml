draw_text_transformed(0, 0, "speed:  " + string(speed), 3, 3, 0)
draw_text_transformed(0, 40, "catched fish: " + string(catched_fish), 3, 3, 0)
draw_text_transformed(0, 80, "fish: " + string(fish_in_inventory), 3, 3, 0)

if (rod_casting_value != 0)
{
	var gh = display_get_gui_height()
	var gw = display_get_gui_width()
	var xsize = gw / 120
	var ysize = gh / 20
	draw_healthbar(gw / 2 + xsize, gh / 2 - ysize, gw / 2 + 2*xsize, gh / 2, rod_casting_value/rod_casting_time*100, c_dkgray, c_orange, c_lime, 3, true, true)
}

if respawn_screen
{
	draw_sprite_stretched(spr_your_stranded, 0, 0, 0, display_get_gui_width(), display_get_gui_height())
}