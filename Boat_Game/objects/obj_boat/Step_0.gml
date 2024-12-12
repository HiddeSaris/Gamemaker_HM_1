#region MOVEMENT

speed *= resistance // slow boat down with resistance

motion_set(image_angle + 90, speed)

image_angle += turning_speed
turning_speed *= resistance / 1.01

if keyboard_check(ord("W"))
{
	speed += acceleration
}
if keyboard_check(ord("S"))
{
	speed -= acceleration
}
if keyboard_check(ord("D"))
{
	if (abs(speed) > 0.3)
	{
		if (speed >= 0){turning_speed -= sqrt(abs(speed)) / 40}
		else {turning_speed += sqrt(abs(speed)) / 40}
	}
	else if (abs(speed) > 0.05)
	{
		if (speed >= 0){turning_speed -= sqrt(abs(speed)) / 80}
		else {turning_speed += sqrt(abs(speed)) / 80}
	}
}
if keyboard_check(ord("A"))
{
	if (abs(speed) > 0.3)
	{
		if (speed >= 0){turning_speed += sqrt(abs(speed)) / 40}
		else {turning_speed -= sqrt(abs(speed)) / 40}
	}
	else if (abs(speed) > 0.05)
	{
		if (speed >= 0){turning_speed += sqrt(abs(speed)) / 80}
		else {turning_speed -= sqrt(abs(speed)) / 80}
	}
}

move_wrap(true, true, -16)

#endregion

#region COLLISION

var _tilemap = layer_tilemap_get_id("Tiles_1")

// Bbox coords
var _left = bbox_left + hspeed;
var _top = bbox_top + vspeed;
var _right = bbox_right + hspeed;
var _bottom = bbox_bottom + vspeed;

// Check collision
var _top_left = tilemap_get_at_pixel(_tilemap, _left, _top);
var _top_right = tilemap_get_at_pixel(_tilemap, _right, _top);
var _bottom_left = tilemap_get_at_pixel(_tilemap, _left, _bottom);
var _bottom_right = tilemap_get_at_pixel(_tilemap, _right, _bottom);

if (_top_left != 8 || _top_right != 8 || _bottom_left != 8 || _bottom_right != 8) // if you touch land
{
	respawn_boat() // crashed
}
#endregion