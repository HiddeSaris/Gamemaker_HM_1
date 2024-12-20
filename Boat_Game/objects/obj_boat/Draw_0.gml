if (cur_boat == 0 and not fishing) // houte boot
{
	draw_sprite(spr_fishing_rod, 3, x - 3, y + 4)
}
else if (cur_boat == 1 and not fishing) // kleine vissersboot
{
	draw_sprite(spr_fishing_rod, 3, x - 6, y + 17)
}
else if (cur_boat == 2 and not fishing) // middel vissersboot
{
	draw_sprite(spr_fishing_rod, 3, x - 3, y + 4)
}