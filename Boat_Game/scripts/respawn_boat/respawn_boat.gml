// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function respawn_boat(){
	var _x = 160
	var _y = 352
	var _rot = 270

	self.x = _x
	self.y = _y
	self.image_angle = _rot
	self.speed = 0
	self.turning_speed = 0
	camera_set_view_pos(view_camera[0], self.x, self.y)
}