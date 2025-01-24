#region BOAT

#region SETTING UP SPEED PER BOAT

// setting up all the data that differs per boat

switch cur_boat 
{
	case 0:  	// houten boot
		max_speed = 0.5
		acceleration = 0.002  
		turning_acceleration = 0.025 
		resistance_1 = 1 - (acceleration / (max_speed + acceleration))
		resistance_2 = power(resistance_1, 8)
		resistance_3 = power(resistance_1, 16)
	break;
	
	case 1:  	// kleine vissersboot
		max_speed = 1
		acceleration = 0.002
		turning_acceleration = 0.020
		resistance_1 = 1 - (acceleration / (max_speed + acceleration))
		resistance_2 = power(resistance_1, 16)
		resistance_3 = power(resistance_1, 32)
	break;
	
	case 2:  	// middel vissersboot
		max_speed = 1.5
		acceleration = 0.001
		turning_acceleration = 0.010
		resistance_1 = 1 - (acceleration / (max_speed + acceleration))
		resistance_2 = power(resistance_1, 16)
		resistance_3 = power(resistance_1, 32)
	break;
	
	case 3:  	// grote vissersboot
		max_speed = 2
		acceleration = 0.001
		turning_acceleration = 0.010
		resistance_1 = 1 - (acceleration / (max_speed + acceleration))
		resistance_2 = power(resistance_1, 16)
		resistance_3 = power(resistance_1, 32)
	break;
	
	case 4:  	// speedboat
		max_speed = 3
		acceleration = 0.004
		turning_acceleration = 0.03
		resistance_1 = 1 - (acceleration / (max_speed + acceleration))
		resistance_2 = power(resistance_1, 16)
		resistance_3 = power(resistance_1, 32)
	break;
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

//speed *= resistance_1 // slow boat down with resistance

motion_set(image_angle + 90, speed)

image_angle += turning_speed
turning_speed *= resistance_1 / 1.01


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
var _tile = tilemap_get_at_pixel(_tilemap, x + hspeed, y + vspeed);

if (_tile == 16) // if you touch land
{
	speed *= resistance_1
}
else if (_tile == 2)
{
	speed *= resistance_2
}
else if (_tile == 3)
{
	speed *= resistance_3
}
else 
{
	speed = 0
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
if ((mouse_check_button(mb_left) or keyboard_check(vk_space)) && fishing && bobber_in_water)
{
	if (fishing_rod_in)
	{
		rod_casting_value++
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
else 
{
	rod_casting_value = 0
}

if (rod_casting_value >= rod_casting_time) // if want to fish
{
	rod_casting_value = 0
	fishing_rod_in = false // cast rod
	fishing_rod_animation_timer = 7 * (sprite_get_number(spr_fishing_rod_lv0) - 1) // set the animation timer
}

// fishing rod animation
if (fishing_rod_animation_timer > 0 && not fishing_rod_out) {fishing_rod_animation_timer -= 1} // count the timer down
if (fishing_rod_animation_timer = 0){fishing_rod_in = true}
frame_fishing_rod = sprite_get_number(fishing_rods[cur_fishing_rod]) - floor(fishing_rod_animation_timer / 7) - 1 // change the current frame to the timer	

if (fishing_rod_animation_timer = fishing_rod_out_frame * 7) 
{
	fishing_rod_out = true // update the variable
} 
if (fishing_rod_out && !fishing_rod_out_prev) // when fishing rod out has changed to true
{
	part_type_orientation(global.pt_water_ripple, image_angle, image_angle, 0, 0, false)
	part_particles_create(global.p_system, bobber_x, bobber_y, global.pt_water_ripple, 1)
}


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

#region Particles

front_boat_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/2, 3) + image_angle;
front_boat_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/2, 3);
front_boat_x = x + lengthdir_x(front_boat_len, front_boat_dir);
front_boat_y = y + lengthdir_y(front_boat_len, front_boat_dir);
// calculations of positions



part_type_direction(global.pt_splash, image_angle-120, image_angle-60, 0, 0);

switch cur_boat
{
	case 0: // houten boot
		
		part_type_speed(global.pt_waves_1, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_1, image_angle, image_angle, -1.2, 0);
		part_type_orientation(global.pt_waves_1, image_angle, image_angle, -1.2, 0, false);
		part_type_life(global.pt_waves_1, 100, 100);
		
		part_type_speed(global.pt_waves_2, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_2, image_angle-180, image_angle-180, 1.2, 0);
		part_type_orientation(global.pt_waves_2, image_angle-180, image_angle-180, 1.2, 0, false);
		part_type_life(global.pt_waves_2, 100, 100);
		
		part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 0)
		
		part_emitter_region(global.p_system, global.p_emitter_waves_1, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_region(global.p_system, global.p_emitter_waves_2, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		
		if (speed > 0.2)
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 1);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 1);
		}
		else 
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 0);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 0);
		}
		// wave particle
		
		motor1_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/2, sprite_height-2) + image_angle;
		motor1_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/2, sprite_height-2);
		motor1_x = x + lengthdir_x(motor1_len, motor1_dir);
		motor1_y = y + lengthdir_y(motor1_len, motor1_dir);
		// calculating where the particles should be drawn
		
		part_type_speed(global.pt_splash, (speed+0.3)/2.5, (speed+0.1), -0.005, 0);
		part_type_life(global.pt_splash, 30, 40);
		
		part_emitter_region(global.p_system, global.p_emitter_splashes_1, motor1_x-5, motor1_x+5, motor1_y-5, motor1_y+5, ps_shape_ellipse, ps_distr_gaussian)
		
		if (keyboard_check(ord("W"))) {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 2)  	}
		else {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 0) 	}
			
		part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 0)
		// splash particle
	break;
	
	case 1: // kleine vissersboot
		
		part_type_speed(global.pt_waves_1, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_1, image_angle, image_angle, -1.0, 0);
		part_type_orientation(global.pt_waves_1, image_angle, image_angle, -1.2, 0, false);
		part_type_life(global.pt_waves_1, 100, 100);
		
		part_type_speed(global.pt_waves_2, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_2, image_angle-180, image_angle-180, 1.0, 0);
		part_type_orientation(global.pt_waves_2, image_angle-180, image_angle-180, 1.0, 0, false);
		part_type_life(global.pt_waves_2, 100, 100);
		
		part_emitter_region(global.p_system, global.p_emitter_waves_1, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_region(global.p_system, global.p_emitter_waves_2, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		
		if (speed > 0.2)
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 1);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 1);
		}
		else 
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 0);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 0);
		}
		// wave particle
		
		motor1_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2) + image_angle;
		motor1_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2);
		motor1_x = x + lengthdir_x(motor1_len, motor1_dir);
		motor1_y = y + lengthdir_y(motor1_len, motor1_dir);
		// calculating where the particles should be drawn
		
		motor2_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2) + image_angle;
		motor2_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2);
		motor2_x = x + lengthdir_x(motor2_len, motor2_dir);
		motor2_y = y + lengthdir_y(motor2_len, motor2_dir);
		// calculating where the particles should be drawn
		
		part_type_speed(global.pt_splash, (speed+0.3)/4, (speed+0.1)/2, -0.005, 0);
		part_type_life(global.pt_splash, 20, 30);
		
		part_emitter_region(global.p_system, global.p_emitter_splashes_1, motor1_x-5, motor1_x+5, motor1_y-5, motor1_y+5, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_region(global.p_system, global.p_emitter_splashes_2, motor2_x-5, motor2_x+5, motor2_y-5, motor2_y+5, ps_shape_ellipse, ps_distr_gaussian)
		
		if (keyboard_check(ord("W"))) {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 2); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 2)  	}
		else {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 0); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 0)  	}
		// splash particle
	break;	
	
	case 2: // middel vissersboot
		
		part_type_speed(global.pt_waves_1, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_1, image_angle, image_angle, -0.8, 0);
		part_type_orientation(global.pt_waves_1, image_angle, image_angle, -0.8, 0, false);
		part_type_life(global.pt_waves_1, 100, 100);
		
		part_type_speed(global.pt_waves_2, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_2, image_angle-180, image_angle-180, 0.8, 0);
		part_type_orientation(global.pt_waves_2, image_angle-180, image_angle-180, 0.8, 0, false);
		part_type_life(global.pt_waves_2, 100, 100);
		
		part_emitter_region(global.p_system, global.p_emitter_waves_1, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_region(global.p_system, global.p_emitter_waves_2, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		
		if (speed > 0.2)
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 2);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 2);
		}
		else 
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 0);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 0);
		}
		// wave particle
		
		motor1_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2) + image_angle;
		motor1_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2);
		motor1_x = x + lengthdir_x(motor1_len, motor1_dir);
		motor1_y = y + lengthdir_y(motor1_len, motor1_dir);
		// calculating where the particles should be drawn
		
		motor2_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2) + image_angle;
		motor2_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2);
		motor2_x = x + lengthdir_x(motor2_len, motor2_dir);
		motor2_y = y + lengthdir_y(motor2_len, motor2_dir);
		// calculating where the particles should be drawn
		
		part_type_speed(global.pt_splash, (speed+0.3)/5, (speed+0.1)/3, -0.005, 0);
		part_type_life(global.pt_splash, 20, 30);
		
		part_emitter_region(global.p_system, global.p_emitter_splashes_1, motor1_x-5, motor1_x+5, motor1_y-5, motor1_y+5, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_region(global.p_system, global.p_emitter_splashes_2, motor2_x-5, motor2_x+5, motor2_y-5, motor2_y+5, ps_shape_ellipse, ps_distr_gaussian)
		
		if (keyboard_check(ord("W"))) {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 2); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 2)  	}
		else {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 0); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 0)  	}
		// splash particle
	break;	
	
	case 3: // grote vissersboot
		
		part_type_speed(global.pt_waves_1, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_1, image_angle, image_angle, -0.8, 0);
		part_type_orientation(global.pt_waves_1, image_angle, image_angle, -0.8, 0, false);
		part_type_life(global.pt_waves_1, 100, 100);
		
		part_type_speed(global.pt_waves_2, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_2, image_angle-180, image_angle-180, 0.8, 0);
		part_type_orientation(global.pt_waves_2, image_angle-180, image_angle-180, 0.8, 0, false);
		part_type_life(global.pt_waves_2, 100, 100);
		
		part_emitter_region(global.p_system, global.p_emitter_waves_1, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_region(global.p_system, global.p_emitter_waves_2, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		
		if (speed > 0.2)
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 2);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 2);
		}
		else 
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 0);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 0);
		}
		// wave particle
		
		motor1_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2) + image_angle;
		motor1_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2);
		motor1_x = x + lengthdir_x(motor1_len, motor1_dir);
		motor1_y = y + lengthdir_y(motor1_len, motor1_dir);
		// calculating where the particles should be drawn
		
		motor2_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2) + image_angle;
		motor2_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2);
		motor2_x = x + lengthdir_x(motor2_len, motor2_dir);
		motor2_y = y + lengthdir_y(motor2_len, motor2_dir);
		// calculating where the particles should be drawn
		
		part_type_speed(global.pt_splash, (speed+0.3)/6, (speed+0.1)/4, -0.005, 0);
		part_type_life(global.pt_splash, 20, 30);
		
		part_emitter_region(global.p_system, global.p_emitter_splashes_1, motor1_x-5, motor1_x+5, motor1_y-5, motor1_y+5, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_region(global.p_system, global.p_emitter_splashes_2, motor2_x-5, motor2_x+5, motor2_y-5, motor2_y+5, ps_shape_ellipse, ps_distr_gaussian)
		
		if (keyboard_check(ord("W"))) {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 2); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 2)  	}
		else {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 0); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 0)  	}
		// splash particle
	break;	
	
	case 4: // speedboat
		
		part_type_speed(global.pt_waves_1, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_1, image_angle, image_angle, -0.8, 0);
		part_type_orientation(global.pt_waves_1, image_angle, image_angle, -0.8, 0, false);
		part_type_life(global.pt_waves_1, 60, 60);
		
		part_type_speed(global.pt_waves_2, speed*0.2, speed*0.3, 0, 0);
		part_type_direction(global.pt_waves_2, image_angle-180, image_angle-180, 0.8, 0);
		part_type_orientation(global.pt_waves_2, image_angle-180, image_angle-180, 0.8, 0, false);
		part_type_life(global.pt_waves_2, 60, 60);
		
		part_emitter_region(global.p_system, global.p_emitter_waves_1, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_region(global.p_system, global.p_emitter_waves_2, front_boat_x-1, front_boat_x+1, front_boat_y-1, front_boat_y+1, ps_shape_ellipse, ps_distr_gaussian);
		
		if (speed > 0.2)
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 3);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 3);
		}
		else 
		{
			part_emitter_stream(global.p_system, global.p_emitter_waves_1, global.pt_waves_1, 0);
			part_emitter_stream(global.p_system, global.p_emitter_waves_2, global.pt_waves_2, 0);
		}
		// wave particle
		
		motor1_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2) + image_angle;
		motor1_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3, sprite_height-2);
		motor1_x = x + lengthdir_x(motor1_len, motor1_dir);
		motor1_y = y + lengthdir_y(motor1_len, motor1_dir);
		// calculating where the particles should be drawn
		
		motor2_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2) + image_angle;
		motor2_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), sprite_width/3*2, sprite_height-2);
		motor2_x = x + lengthdir_x(motor2_len, motor2_dir);
		motor2_y = y + lengthdir_y(motor2_len, motor2_dir);
		// calculating where the particles should be drawn
		
		part_type_speed(global.pt_splash, (speed+0.3)/8, (speed+0.1)/6, -0.005, 0);
		part_type_life(global.pt_splash, 10, 15);
		
		part_emitter_region(global.p_system, global.p_emitter_splashes_1, motor1_x-5, motor1_x+5, motor1_y-5, motor1_y+5, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_region(global.p_system, global.p_emitter_splashes_2, motor2_x-5, motor2_x+5, motor2_y-5, motor2_y+5, ps_shape_ellipse, ps_distr_gaussian)
		
		if (keyboard_check(ord("W"))) {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 2); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 2)  	}
		else {	part_emitter_stream(global.p_system, global.p_emitter_splashes_1, global.pt_splash, 0); part_emitter_stream(global.p_system, global.p_emitter_splashes_2, global.pt_splash, 0)  	}
		// splash particle
	break;	
}

#endregion