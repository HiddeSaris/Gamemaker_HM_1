draw_self();

if (not fishing)
{
	fishing_rod_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1]) + image_angle
	fishing_rod_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1])
	draw_sprite_ext(spr_fishing_rod_lv1, 0, x + lengthdir_x(fishing_rod_len, fishing_rod_dir), y + lengthdir_y(fishing_rod_len, fishing_rod_dir), 1, 1, image_angle + 90, c_white, 1)
}
else 
{
	person_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1]) + image_angle
	person_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1])
	person_x = x + lengthdir_x(person_len, person_dir)
	person_y = y + lengthdir_y(person_len, person_dir)
	draw_sprite_ext(spr_person, frame_person, person_x, person_y, 1, 1, image_angle, c_white, 1)
	draw_sprite_ext(spr_fishing_rod_lv1, frame_fishing_rod, person_x, person_y, 1, 1, image_angle, c_white, 1)
}

if (fishing_rod_out && !fishing_rod_out_prev) // when fishing rod out has changed to true
{
	animation_timer = 12 * sprite_get_number(spr_splash) // start the animation
}
if (animation_timer > 0)
{
	animation_timer -= 1
	animation_frame = sprite_get_number(spr_splash) - floor(animation_timer / 12)
	draw_sprite_ext(spr_splash, animation_frame, bobber_x, bobber_y, 1, 1, image_angle, c_white, 1)
}

fishing_rod_out_prev = fishing_rod_out
fishing_rod_in_prev = fishing_rod_in