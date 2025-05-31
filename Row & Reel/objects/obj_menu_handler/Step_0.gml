var _mx = mouse_x;
var _my = mouse_y;

var _tilemap = layer_tilemap_get_id("beach")
var _tile = tilemap_get_at_pixel(_tilemap, _mx, _my);

on_button = false;


// start button
if (_tile >= 58 && 330 < _my && _my < 435){
	on_button = true;
	if (cur_button != buttons.play){
		audio_play_sound(snd_click, 10, false, 2)
	}
	cur_button = buttons.play;
}
// how to play button
if (_tile >= 58 && 460 < _my && _my < 560){
	on_button = true;
	if (cur_button != buttons.how){
		audio_play_sound(snd_click, 10, false, 2)
	}
	cur_button = buttons.how;
}

// quit button
if (_tile >= 58 && 590 < _my && _my < 690){
	on_button = true;
	if (cur_button != buttons.quit){
		audio_play_sound(snd_click, 10, false, 2)
	}
	cur_button = buttons.quit;
}


if ((mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter)) && on_button){

	audio_play_sound(snd_click, 10, false, 2)
	
	switch cur_button{
		
		case buttons.play:
			room_goto_next();
		break;
			
		case buttons.how:
			controls = !controls;
		break;
			
		case buttons.quit:
			game_end();
		break;
			
	}
}