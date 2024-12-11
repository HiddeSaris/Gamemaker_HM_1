#region MOVEMENT

//angle_speed = point_direction(0, 0, hspeed, vspeed)
//resistance = resistance / angle_difference(angle_speed, image_angle) 

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