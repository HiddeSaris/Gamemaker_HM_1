enum buttons{
	play,
	how,
	quit,
}

heights = [380, 507, 635]

cur_button = 0;
on_button = false

controls = false;

if (!audio_is_playing(snd_wind)){
	audio_play_sound(snd_wind, 30, true, 1.5);
}
if (!audio_is_playing(snd_seagull_all)){
	audio_play_sound(snd_seagull_all, 30, true, 0.5)
}