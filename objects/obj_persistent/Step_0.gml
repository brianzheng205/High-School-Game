key_restart = keyboard_check_pressed(ord("R"));

if (key_restart) {
	game_restart();
}

if (room != Start and !playing) {
	audio_play_sound(elevator_music, 1, true);
	playing = true;
}