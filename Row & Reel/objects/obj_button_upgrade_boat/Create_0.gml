/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

activate_button = function() 
{
	if (obj_dock_pos.shop){
		if (obj_boat.bought_boat < array_length(obj_boat.boats)-1 && obj_boat.money >= obj_boat.boat_prices[obj_boat.bought_boat+1]){
		
			audio_play_sound(snd_click, 10, false, 2)
		
			obj_boat.bought_boat++;
			obj_boat.cur_boat = obj_boat.bought_boat;
			obj_boat.sprite_index = obj_boat.boats[obj_boat.cur_boat];
			obj_boat.money -= obj_boat.boat_prices[obj_boat.cur_boat];
		}
		else{
			audio_play_sound(snd_error, 10, false, 4)
		}
	}
}