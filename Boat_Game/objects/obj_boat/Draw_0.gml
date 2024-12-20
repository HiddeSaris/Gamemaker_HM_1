draw_self();

if (not fishing)
{
	draw_sprite_ext(spr_fishing_rod, 3, x + lengthdir_x(fishing_rod_len, fishing_rod_dir), y + lengthdir_y(fishing_rod_len, fishing_rod_dir), 1, 1, image_angle, c_white, 1)
}
