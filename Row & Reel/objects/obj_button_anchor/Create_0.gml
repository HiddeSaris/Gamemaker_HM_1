/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

activate_button = function() 
{
	if (obj_boat.anchor && !obj_boat.fishing && obj_boat.image_speed == 0) {
		obj_boat.anchor = false; 
		obj_dock_pos.shop = false;
		obj_button_upgrade_boat.visible = false;
		obj_button_upgrade_rod.visible = false;
		obj_button_sell.visible = false;
	}
	else if (!obj_boat.anchor) {obj_boat.anchor = true}
}