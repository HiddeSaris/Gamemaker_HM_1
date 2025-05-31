/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

activate_button = function() 
{
	if (obj_dock_pos.shop){
		if (array_length(obj_boat.fish_in_inventory) == 0){
			audio_play_sound(snd_error, 10, false, 4)
		}
		else{
			obj_boat.selling = true;
		}
	}
}