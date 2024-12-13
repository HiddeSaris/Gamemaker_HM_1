// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function respawn_boat(){
	var _cur_time = current_time
	var _x = 160
	var _y = 352
	var _rot = 270

	self.x = _x
	self.y = _y
	self.image_angle = _rot
	self.speed = 0
	self.turning_speed = 0
}