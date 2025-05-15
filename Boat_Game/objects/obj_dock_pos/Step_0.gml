
// check if in region
if (rectangle_in_rectangle(obj_boat.bbox_left, obj_boat.bbox_top, obj_boat.bbox_right, obj_boat.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom) == 1){
	in_rectangle = true;
}
else{
	in_rectangle = false;	
	shop = false;
}

if (in_rectangle_prev == false and in_rectangle == true){
	start_time = current_time;
}

if (in_rectangle or abs(image_alpha - 0.75) > 0.01){
	image_alpha = sin((current_time - start_time) / 200 + pi/2) / 4 + 0.5;
}
else{
	image_alpha = 0.75;
}

if (in_rectangle and !shop and image_alpha > 0.26){
	shop = true;
}




in_rectangle_prev = in_rectangle;