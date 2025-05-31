/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

activate_button = function() 
{
	if (obj_dock_pos.shop){
		if (obj_boat.bought_rod < array_length(obj_boat.fishing_rods)-1 && obj_boat.money >= obj_boat.fishing_rod_prices[obj_boat.bought_rod+1]){
		
			audio_play_sound(snd_click, 10, false, 2)
		
			obj_boat.bought_rod++;
			obj_boat.cur_fishing_rod = obj_boat.bought_rod;
			obj_boat.money -= obj_boat.fishing_rod_prices[obj_boat.cur_fishing_rod];
		}
		else{
			audio_play_sound(snd_error, 10, false, 4)
		}
	}
}