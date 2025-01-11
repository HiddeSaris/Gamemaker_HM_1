#region BOAT

#region SETTING UP SPEED PER BOAT

// setting up all the data that differs per boat

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
	
	person_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1]) + image_angle
	person_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1])
	person_x = x + lengthdir_x(person_len, person_dir)
	person_y = y + lengthdir_y(person_len, person_dir)
	// update person position
	
	bobber_dir = point_direction(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0) + image_angle
	bobber_len = point_distance(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0)
	bobber_x = person_x + lengthdir_x(bobber_len, bobber_dir)
	bobber_y = person_y + lengthdir_y(bobber_len, bobber_dir)
	// update bobber position
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

var _tilemap = layer_tilemap_get_id("Collision_layer")
/* // Bbox coords
var _left = bbox_left + hspeed;
var _top = bbox_top + vspeed;
var _right = bbox_right + hspeed;
var _bottom = bbox_bottom + vspeed;

// Check collision
var _top_left = tilemap_get_at_pixel(_tilemap, _left, _top);
var _top_right = tilemap_get_at_pixel(_tilemap, _right, _top);
var _bottom_left = tilemap_get_at_pixel(_tilemap, _left, _bottom);
var _bottom_right = tilemap_get_at_pixel(_tilemap, _right, _bottom);

if (_top_left != 16 || _top_right != 16 || _bottom_left != 16 || _bottom_right != 16) // if you touch land
{
	respawn_boat()
} */

// Check collision
var _top_left_h = tilemap_get_at_pixel(_tilemap, bbox_left + hspeed, bbox_top + hspeed);
var _top_right_h = tilemap_get_at_pixel(_tilemap, bbox_right + hspeed, bbox_top + hspeed);
var _bottom_left_h = tilemap_get_at_pixel(_tilemap, bbox_left + hspeed, bbox_bottom + hspeed);
var _bottom_right_h = tilemap_get_at_pixel(_tilemap, bbox_right + hspeed, bbox_bottom + hspeed);

// Check collision
var _top_left_v = tilemap_get_at_pixel(_tilemap, bbox_left + vspeed, bbox_top + vspeed);
var _top_right_v = tilemap_get_at_pixel(_tilemap, bbox_right + vspeed, bbox_top + vspeed);
var _bottom_left_v = tilemap_get_at_pixel(_tilemap, bbox_left + vspeed, bbox_bottom + vspeed);
var _bottom_right_v = tilemap_get_at_pixel(_tilemap, bbox_right + vspeed, bbox_bottom + vspeed);

if (_top_left_h != 16 || _top_right_h != 16 || _bottom_left_h != 16 || _bottom_right_h != 16)// && abs(speed) > 0.1 // if you touch land
{
	hspeed = 0
	turning_speed = 0
}
if (_top_left_v != 16 || _top_right_v != 16 || _bottom_left_v != 16 || _bottom_right_v != 16)// && abs(speed) > 0.1 // if you touch land
{
	vspeed = 0
	turning_speed = 0
}

#endregion

#region ANCHOR

if (keyboard_check_pressed(ord("F")))
{
	if (anchor && !fishing && image_speed == 0) {anchor = false}
	else if (!anchor) {anchor = true}
}

if (anchor && (speed >= 0.01 || speed <= -0.01))
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


// go to fishing pos
if (keyboard_check_pressed(ord("E"))) 
{
	if (anchor)
	{
		if (not fishing)
		{
			wanting_to_fish = true
			steering = false
			image_speed = 1 // walk to fishing position
			fishing_rod_animation_timer = -1
		}
		else if (not fishing_rod_out)
		{
			fishing = false
			wanting_to_steer = true
			image_speed = 1 // stop the animation
			//image_index = 0 // go back to steering position
		}
	}
	else
	{
		show_message("Je moet je anker uit hebben om te vissen")
	}
}


// calculating the bobbers position
bobber_dir = point_direction(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0) + image_angle
bobber_len = point_distance(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0)

bobber_x = person_x + lengthdir_x(bobber_len, bobber_dir)
bobber_y = person_y + lengthdir_y(bobber_len, bobber_dir)

var _bobber_tilemap = tilemap_get_at_pixel(_tilemap, bobber_x, bobber_y);

if (_bobber_tilemap != 16) // if you touch land
{
	bobber_in_water = false
}
else 
{
	bobber_in_water = true
}


// frame of the walking animation when at fishing pos
if (image_index >= fishing_frame_boats[cur_boat] && !wanting_to_steer) 
{
	wanting_to_fish = false
	fishing = true // now able to fish
	image_speed = 0 // stop the animation
}


// last frame of the walking animation
if (image_index <= 1 && !wanting_to_fish) 
{
	wanting_to_steer = false
	steering = true // now able to steer
	image_speed = 0 // stop the animation
}

// throwing out the fishing rod
if (keyboard_check_pressed(vk_space) && fishing && bobber_in_water) // if want to fish
{
	if (fishing_rod_in) // cast rod
	{
		fishing_rod_in = false
		fishing_rod_animation_timer = 7 * (sprite_get_number(spr_fishing_rod_lv0) - 1) // set the animation timer
	}
	else if (fishing_rod_out)// pull the rod out of the water
	{
		fishing_rod_out = false
		catched_fish = fish_drop(100, drop_tables.regular)
		array_push(fish_in_inventory, catched_fish)
	}
}
else if (keyboard_check_pressed(vk_space) && fishing && not bobber_in_water)
{
	show_message("did you know you have to fish in water, you learn something new every day.")
}


// fishing rod animation
if (fishing_rod_animation_timer > 0 && not fishing_rod_out) {fishing_rod_animation_timer -= 1} // count the timer down
if (fishing_rod_animation_timer = 0){fishing_rod_in = true}
	
if (fishing_rod_animation_timer = fishing_rod_out_frame * 7) 
{
	fishing_rod_out = true // update the variable
} 
frame_fishing_rod = sprite_get_number(fishing_rods[cur_fishing_rod]) - floor(fishing_rod_animation_timer / 7) - 1 // change the current frame to the timer

// switching between different fishing rods
if (keyboard_check_pressed(ord("R")))
{
	if (cur_fishing_rod = array_length(fishing_rods) - 1) // If its the last boat
	{
		cur_fishing_rod = 0
	}
	else
	{
		cur_fishing_rod += 1
	}
}

#endregion