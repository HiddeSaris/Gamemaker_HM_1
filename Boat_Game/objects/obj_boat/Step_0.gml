#region MOVEMENT

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