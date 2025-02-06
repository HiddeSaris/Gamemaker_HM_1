target_room = island_base

switch room{
	case island_base:
		target_room = world_map;
		target_x = 50;
		target_y = 50;
	break;
	case world_map:
		target_room = island_base;
		target_x = 500;
		target_y = 500;
	break;
}

if (place_meeting(x, y, obj_boat) && timer == -1)
{
	timer = 0;
}

cur_frame = timer / sec_per_frame;

if (timer < duration - 1 && timer >= 0  && !reverse)
{
	timer++;
	drawing = true;
}
else if (reverse && timer >= 0)
{
	timer--;
	drawing = true;
}
else if (timer >= duration - 1)
{
	reverse = true;
	room_goto(target_room)
	obj_boat.x = target_x
	obj_boat.y = target_y
	obj_camera.x = target_x
	obj_camera.y = target_y
}
else 
{
	drawing = false
	reverse = false
}