var _mx = window_mouse_get_x();
var _my = window_mouse_get_y();

var _tilemap = layer_tilemap_get_id("beach")
var _tile = tilemap_get_at_pixel(_tilemap, _mx, _my);



// start button
if (_tile > 58 && 330 < _my && _my < 435){
	cur_button = buttons.play;
}
// how to play button
if (_tile > 58 && 460 < _my && _my < 560){
	cur_button = buttons.how;
}

// quit button
if (_tile > 58 && 590 < _my && _my < 690){
	cur_button = buttons.quit;
}


if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter)){
	switch cur_button{
		
		case buttons.play:
			room_goto_next();
		break;
			
		case buttons.how:
			// how to play room
		break;
			
		case buttons.quit:
			game_end();
		break;
			
	}
}