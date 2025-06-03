#region FOLLOW

var _cam = view_camera[0]

var _cam_width = camera_get_view_width(_cam)
var _cam_height = camera_get_view_height(_cam)

if (follow != noone)
{
	xto = follow.x
	yto = follow.y
}

x += (xto - x) / 25
y += (yto - y) / 25

camera_set_view_pos(_cam, x - (_cam_width * 0.5), y - (_cam_height * 0.5));

#endregion

#region ZOOM
/*
var _scroll_multiplier = 1.05

var _cam_x = camera_get_view_x(_cam)
var _cam_y = camera_get_view_y(_cam)

if (mouse_wheel_down())
{
	camera_set_view_pos(_cam, _cam_x - (_cam_width * (_scroll_multiplier - 1)) / 2, _cam_y - (_cam_height * (_scroll_multiplier - 1)) / 2)
	camera_set_view_size(_cam, _cam_width * _scroll_multiplier, _cam_height * _scroll_multiplier)
}
if (mouse_wheel_up())
{
	camera_set_view_pos(_cam, _cam_x + (_cam_width - _cam_width / _scroll_multiplier) / 2, _cam_y + (_cam_height - _cam_height / _scroll_multiplier) / 2)
	camera_set_view_size(_cam, _cam_width / _scroll_multiplier, _cam_height / _scroll_multiplier)
}
*/
#endregion