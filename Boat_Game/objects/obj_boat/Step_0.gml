#region BOAT

#region SETTING UP SPEED PER BOAT

if (cur_boat = 0) // houte boot
{
	max_speed = 0.5
	acceleration = 0.001  
	turning_acceleration = 0.025 
	resistance = 1 - (acceleration / (max_speed + acceleration))
}
else if (cur_boat = 1) // kleine vissersboot
{
	max_speed = 1
	acceleration = 0.002
	turning_acceleration = 0.020
	
	resistance = 1 - (acceleration / (max_speed + acceleration))
}
else if (cur_boat = 2) // middel vissersboot
{
	max_speed = 1.5
	acceleration = 0.001
	turning_acceleration = 0.010
	
	resistance = 1 - (acceleration / (max_speed + acceleration))
}
else if (cur_boat = 3) // grote vissersboot
{
	max_speed = 2
	acceleration = 0.001
	turning_acceleration = 0.010
	
	resistance = 1 - (acceleration / (max_speed + acceleration))
}
else if (cur_boat = 4) // speedboat
{
	max_speed = 3
	acceleration = 0.004
	turning_acceleration = 0.03
	
	resistance = 1 - (acceleration / (max_speed + acceleration))
}

#endregion

#region SWITCHING BOAT

if (keyboard_check_pressed(ord("Q")))
{
	if (cur_boat = array_length(boats) - 1) // If its the last boat
	{
		cur_boat = 0
	}
	else
	{
		cur_boat += 1
	}
	self.sprite_index = boats[cur_boat]
	// assign the new sprite
	
	fishing_rod_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1])
	fishing_rod_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1])
	// update rod position
}

#endregion

#endregion

#region MOVEMENT

speed *= resistance // slow boat down with resistance

motion_set(image_angle + 90, speed)

image_angle += turning_speed
turning_speed *= resistance / 1.01


if (keyboard_check(ord("W")) && !anchor)
{
	speed += acceleration
}
if (keyboard_check(ord("S")) && !anchor)
{
	speed -= acceleration
}
if (keyboard_check(ord("D")) && !anchor)
{
	if (abs(speed) > 0.3)
	{
		if (speed >= 0){turning_speed -= sqrt(abs(speed)) * turning_acceleration}
		else {turning_speed += sqrt(abs(speed)) * turning_acceleration}
	}
	else if (abs(speed) > 0.05)
	{
		if (speed >= 0){turning_speed -= sqrt(abs(speed)) * turning_acceleration / 2}
		else {turning_speed += sqrt(abs(speed)) * turning_acceleration / 2}
	}
}
if (keyboard_check(ord("A")) && !anchor)
{
	if (abs(speed) > 0.3)
	{
		if (speed >= 0){turning_speed += sqrt(abs(speed)) * turning_acceleration}
		else {turning_speed -= sqrt(abs(speed)) * turning_acceleration}
	}
	else if (abs(speed) > 0.05)
	{
		if (speed >= 0){turning_speed += sqrt(abs(speed)) * turning_acceleration / 2}
		else {turning_speed -= sqrt(abs(speed)) * turning_acceleration / 2}
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
	respawn_boat()
}
#endregion

#region ANCHOR

if (keyboard_check_pressed(ord("F")))
{
	if (anchor && !fishing && image_speed == 0) {anchor = false}
	else if (!anchor) {anchor = true}
}

if (anchor && speed >= 0.01)
{
	speed *= 0.95
	turning_speed *= 0.95
}
else if (anchor)
{
	speed = 0
	turning_speed = 0
}

#endregion

#region FISHING

if (keyboard_check_pressed(ord("E"))) // go to fishing pos
{
	if (anchor)
	{
		if (not fishing)
		{
			image_speed = 1 // walk to fishing position
		}
		else 
		{
			image_index = 0 // go back to steering position
			fishing = false
			image_speed = 0 // stop the animation
		}
	}
	else
	{
		show_message("Je moet je anker uit hebben om te vissen")
	}
}

if (image_index >= image_number - 1) // laatste frame van animatie
{
	fishing = true
	image_speed = 0
}

if (keyboard_check_pressed(vk_space) && fishing) // if want to fish
{
	fishing_rod_animation_timer = 7 * sprite_get_number(spr_fishing_rod) // set the animation timer
}

if (fishing_rod_animation_timer > 0) {fishing_rod_animation_timer -= 1} // count the timer down

frame_fishing_rod = 7 * sprite_get_number(spr_fishing_rod) - floor(fishing_rod_animation_timer / 7) // change the current frame to the timer

#endregion