#region MOVEMENT

//angle_speed = point_direction(0, 0, hspeed, vspeed)

//resistance = resistance / angle_difference(angle_speed, image_angle) 

speed *= resistance // slow boat down with resistance

motion_set(image_angle + 90, speed)

//general_speed = sqrt(sqr(xspeed) + sqr(yspeed))

if keyboard_check(ord("W"))
{
	speed += acceleration
}

if keyboard_check(ord("D"))
{
	image_angle -= power(speed, 0.5)
}
if keyboard_check(ord("A"))
{
	image_angle += power(speed, 0.5)
}

#endregion