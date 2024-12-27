draw_text_transformed(0, 0, "speed:  " + string(speed), 3, 3, 0)
draw_text_transformed(0, 40, "anchor: " + string(anchor), 3, 3, 0)
draw_text_transformed(0, 80, "fishing: " + string(fishing), 3, 3, 0)
draw_text_transformed(0, 120, "fish anim timer: " + string(fishing_rod_animation_timer), 3, 3, 0)

if respawn_screen
{
	draw_sprite_stretched(spr_your_stranded, 0, 0, 0, display_get_gui_width(), display_get_gui_height())
}