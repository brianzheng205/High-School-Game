key_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
key_use = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter);

// play
if (key_use and index == 0) {
	first_screen = false;
	select_level_screen = true;
}

// how to play
if (key_use and index == 1) {
	key_use_count++
	if (key_use_count == 1) {
		first_screen = false;
		how_to_play_screen = true;
	}
	else if (key_use_count == 2) {
		how_to_play_screen = false;
		select_level_screen = true;
	}
}

if (fade == 1 and count == 0) {
	count++;
	alarm[2] = room_speed * 1;
}

// select first screen
if (key_up and index == 1 and first_screen) {
	index--;
	alpha = 0;
	decreasing = false;
}

if (key_down and index == 0 and first_screen) {
	index++;
	alpha = 0;
	decreasing = false;
}

// select level screen
if (key_up and index_2 > 0 and select_level_screen) {
	index_2--;
	alpha = 0;
	decreasing = false;
}
	
if (key_down and index_2 < 2 and select_level_screen) {
	index_2++;
	alpha = 0;
	decreasing = false;
}

if (select_level_screen and key_use) {
	if (key_use_count_2 == 1) {
		if (index_2 == 0) {
			obj_persistent.as_i_lay_dying = true;
		}
		else if (index_2 == 1) {
			obj_persistent.socratic_seminar = true;
		}
		else {
			obj_persistent.freeplay = true;
		}
		alarm[1] = room_speed * 0.05;
	}
	key_use_count_2++;
}