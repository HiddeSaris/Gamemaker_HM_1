if (follow != noone)
{
	xto = follow.x
	yto = follow.y
}

x += (xto - x)/25
y += (yto - y)/25

camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_hight * 0.5));