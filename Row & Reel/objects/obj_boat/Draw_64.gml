var gh = display_get_gui_height()
var gw = display_get_gui_width()

draw_set_font(fnt_iflash);
draw_set_color(#7F6132);

/*
draw_set_halign(fa_right);
draw_text_transformed(gw, 0, "money:  " + string(money), 3, 3, 0)
draw_text_transformed(gw, 30, "catched fish: " + string(catched_fish), 3, 3, 0)
draw_text_transformed(gw, 60, "fish: " + string(fish_in_inventory), 3, 3, 0)
draw_text_transformed(gw, 90, "height1: " + string(gh/8*5), 3, 3, 0)
draw_text_transformed(gw, 120, "timer: " + string(sell_timer), 3, 3, 0)
draw_set_halign(fa_left);
*/

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

// money ui
draw_sprite_stretched(spr_gui_back_money, 0, 20, 20, 210, 80)
draw_text_border(50, 40, string(money) + " coins", 3, 3, c_black, #CC9D50)

// Upgrade
if (obj_dock_pos.shop and anchor){
	draw_sprite_stretched(spr_gui_back, 0, gw/6-50, 50, gw/3, gh-100)
	
	draw_set_halign(fa_center);
	draw_set_color(#7F6132);
	
	draw_text_transformed(gw/3-50, 100, "UPGRADE", 7, 7, 0)
	
	if (cur_fishing_rod < array_length(fishing_rod_prices)-1){
		draw_text_transformed(gw/3-30, 270, "fishing rod:    " + string(fishing_rod_prices[cur_fishing_rod+1]) + "c", 4, 4, 0)
	}else {
		draw_text_transformed(gw/3-30, 270, "fishing rod:   MAX", 4, 4, 0)
	}
	
	if (cur_boat < array_length(boat_prices)-1){
		draw_text_transformed(gw/3-10, 465, "boat:       " + string(boat_prices[cur_boat+1]) + "c", 4, 4, 0)
	}else {
		draw_text_transformed(gw/3-10, 465, "boat:      MAX", 4, 4, 0)
	}
	
	draw_set_halign(fa_left);
	
	draw_sprite_ext(boats[cur_boat], 0, gw/3-100, gh/8*6, 4, 4, 270, c_white, 1)
	draw_sprite_ext(fishing_rods[cur_fishing_rod], 0, gw/3 - 3 * 20-130, gh/8 * 4, 20, 20, 180, c_white, 1)
}
if (obj_dock_pos.shop){
	obj_button_upgrade_boat.visible = anchor;
	obj_button_upgrade_rod.visible = anchor;
	obj_button_sell.visible = anchor;
}

// Sell
if (obj_dock_pos.shop and anchor){
	draw_sprite_stretched(spr_gui_back, 0, gw/2+50, 50, gw/3, gh-100)
	
	draw_set_halign(fa_center);
	draw_set_color(#7F6132);
	draw_text_transformed(gw/3*2+50, 100, "SELL FISH", 7, 7, 0)
	
	
	
	var _fish = fish_in_inventory
	var fc = obj_loot_table.fish_catalogue
	var col_len = 8
	
	draw_set_color(#AA8343);
	
	if (array_length(fish_in_inventory) == 0){
		draw_text_transformed(gw/6*4+50, 250, "You don't have any fish", 3, 3, 0)
	}
	
	draw_set_color(#7F6132);
	draw_set_halign(fa_left);
	
	for (var i=0; i<array_length(fish_in_inventory);i++){
		draw_text_transformed(gw/2-130 + 210*ceil((i+1)/col_len), 220 + (i % col_len)*40, ">" + fc[_fish[i]][drop_name] + ": " + string(fc[_fish[i]][drop_price]) + "c", 3, 3, 0)
	}
}

if (rod_casting_value != 0)
{
	
	var xsize = gw / 120;
	var ysize = gh / 20;
	draw_healthbar(gw / 2 + xsize, gh / 2 - ysize, gw / 2 + 2*xsize, gh / 2, rod_casting_value/rod_casting_time*100, c_dkgray, c_orange, c_lime, 3, true, true);
}

draw_set_halign(fa_center)

if (fish_text_timer >= 0){
	draw_text_border(gw/2, 80, obj_loot_table.fish_catalogue[catched_fish][drop_name] + ",", 4, 4, c_black, #D6AA63)
	draw_text_border(gw/2, 130, "worth " + string(obj_loot_table.fish_catalogue[catched_fish][drop_price]) + " coins!", 4, 4, c_black, #D6AA63)
}

if (need_anchor_text_timer >= 0){
	draw_text_border(gw/2, 80, "You need to have your anchor out to fish!", 4, 4, c_black, #D6AA63)
}

if (bobber_on_land_text_timer >= 0){
	draw_text_border(gw/2, 80, "Did you know you have to fish in the water?", 4, 4, c_black, #D6AA63)
	draw_text_border(gw/2, 130, "You learn something new every day!", 4, 4, c_black, #D6AA63)
}

draw_set_halign(fa_left)