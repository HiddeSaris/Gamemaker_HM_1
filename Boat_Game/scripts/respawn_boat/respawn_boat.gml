// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function respawn_boat(){
	alarm[0] = 180
	respawn_screen = true

	self.x = respawn_x
	self.y = respawn_y
	self.image_angle = respawn_rot
	self.speed = 0
	self.turning_speed = 0
	camera_set_view_pos(view_camera[0], self.x, self.y) 
}