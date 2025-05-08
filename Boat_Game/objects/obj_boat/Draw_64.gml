var gh = display_get_gui_height()
var gw = display_get_gui_width()

draw_set_halign(fa_right)
draw_text_transformed(gw, 0, "speed:  " + string(speed), 3, 3, 0)
draw_text_transformed(gw, 40, "catched fish: " + string(catched_fish), 3, 3, 0)
draw_text_transformed(gw, 80, "fish: " + string(fish_in_inventory), 3, 3, 0)
draw_text_transformed(gw, 120, "fish timer: " + string(fish_timer), 3, 3, 0)
draw_text_transformed(gw, 160, "fish on hook timer: " + string(fish_on_hook_timer), 3, 3, 0)
draw_text_transformed(gw, 200, "indicator_speed: " + string(indicator_speed), 3, 3, 0)
draw_text_transformed(gw, 240, "indicator_y: " + string(indicator_y), 3, 3, 0)
draw_text_transformed(gw, 280, "fish_y: " + string(game_fish_y), 3, 3, 0)
draw_text_transformed(gw, 320, "fish_new_y: " + string(game_fish_old_y + game_fish_new_y_change), 3, 3, 0)
draw_text_transformed(gw, 360, "duration: " + string(game_fish_cur_dur), 3, 3, 0)
draw_text_transformed(gw, 400, "score: " + string(game_score), 3, 3, 0)
draw_set_halign(fa_left)

if (fishing_game)
{
	// Background
	draw_sprite_ext(spr_fishing_minigame, 0, gw/16, gh/2, 5, 5, 0, c_white, 1);

	// indicator
	if (!surface_exists(surface_indicator)){
		surface_indicator = surface_create(sprite_get_width(spr_fishing_indicator), 79);
	}
	
	surface_set_target(surface_indicator);
	draw_clear_alpha(0, 0);
	
	draw_sprite_ext(spr_fishing_indicator, 0, 0, 79, 1, indicator_height/sprite_get_height(spr_fishing_indicator), 0, c_white, 1);
	
	surface_reset_target();
	
	draw_surface_ext(surface_indicator, gw/16 + 20*5, gh/2 - 36*5 - indicator_y*5, 5, 5, 0, c_white, 1);
	
	// fish
	draw_sprite_ext(spr_fishing_game_fish, 0, gw/16 + 20*5 + 2, gh/2 + 43*5 - 1 - game_fish_y*5, 2, 2, 0, c_white, 1)
	
	// score bar
	draw_healthbar(gw/16 + 31*5, gh/2 + 43*5, gw/16 + 34*5, gh/2 - 36*5, game_score/game_req_score*100, c_black, c_orange, c_lime, 2, false, false)
}	
	

if (rod_casting_value != 0)
{
	
	var xsize = gw / 120;
	var ysize = gh / 20;
	draw_healthbar(gw / 2 + xsize, gh / 2 - ysize, gw / 2 + 2*xsize, gh / 2, rod_casting_value/rod_casting_time*100, c_dkgray, c_orange, c_lime, 3, true, true);
}

draw_set_halign(fa_center)

if (fish_on_hook)
{
	draw_text_transformed(gw/2, 80, "you have a fish on your hook!", 3, 3, 0)
}

draw_set_halign(fa_left)

if respawn_screen
{
	draw_sprite_stretched(spr_your_stranded, 0, 0, 0, gw, gh)
}