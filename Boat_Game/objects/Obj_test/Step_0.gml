#region MOVEMENT

angle_speed = point_direction(0, 0, xspeed, yspeed)

//resistance = resistance / angle_difference(angle_speed, image_angle) 

xspeed *= resistance // slow boat down with resistance
yspeed *= resistance // slow boat down with resistance

x += xspeed
y += yspeed

general_speed = sqrt(sqr(xspeed) + sqr(yspeed))

if keyboard_check(ord("W"))
{
	xspeed += acceleration
	yspeed += acceleration
}

if keyboard_check(ord("D"))
{
	image_angle -= gen_speed
}
if keyboard_check(ord("A"))
{
	image_angle += gen_speed
}

#endregion