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
	if (speed >= 0){turning_speed -= sqrt(abs(speed)) / 40}
	else {turning_speed += sqrt(abs(speed)) / 40}
}
if keyboard_check(ord("A"))
{
	if (speed >= 0){turning_speed += sqrt(abs(speed)) / 40}
	else {turning_speed -= sqrt(abs(speed)) / 40}
}

#endregion

#region COLLISION

var _tilemap = layer_tilemap_get_id("Tiles_1")

var _next_pos_x = x + hspeed
var _next_pos_y = y + vspeed

var _next_pos_tile = tilemap_get_at_pixel(layer_tilemap_get_id("Tiles_1"), _next_pos_x, _next_pos_y)

// Bbox coords
var _left = bbox_left + hspeed;
var _top = bbox_top + vspeed;
var _right = bbox_right + hspeed;
var _bottom = bbox_bottom + vspeed;

// Check collision
var _collision = tilemap_get_at_pixel(_tilemap, _left, _top) ||
			tilemap_get_at_pixel(_tilemap, _right, _top) ||
			tilemap_get_at_pixel(_tilemap, _left, _bottom) ||
			tilemap_get_at_pixel(_tilemap, _right, _bottom);

#endregion