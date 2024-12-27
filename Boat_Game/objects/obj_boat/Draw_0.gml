draw_self();

if (not fishing)
{
	fishing_rod_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1]) + image_angle
	fishing_rod_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1])
	draw_sprite_ext(spr_fishing_rod, 3, x + lengthdir_x(fishing_rod_len, fishing_rod_dir), y + lengthdir_y(fishing_rod_len, fishing_rod_dir), 1, 1, image_angle, c_white, 1)
}
else 
{
	person_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1]) + image_angle
	person_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1])
	draw_sprite_ext(spr_person, frame_person, x + lengthdir_x(person_len, person_dir), y + lengthdir_y(person_len, person_dir), 1, 1, image_angle, c_white, 1)
	draw_sprite_ext(spr_fishing_rod, frame_fishing_rod, x + lengthdir_x(person_len, person_dir), y + lengthdir_y(person_len, person_dir), 1, 1, image_angle, c_white, 1)
}
