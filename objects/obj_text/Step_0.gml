key_use = keyboard_check_pressed(vk_space);

// AS I LAY DYING
if (obj_persistent.as_i_lay_dying) {
	if (layer_exists("Collision_So")) {
		layer_set_visible("English_Class_Socratic_Seminar", false);
		layer_destroy("Collision_So");
	}
}

// SOCRATIC SEMINAR
else if (obj_persistent.socratic_seminar) {
	if (layer_exists("Collision_As")) {
		layer_set_visible("NPCs", false);
		layer_set_visible("Desks_Top", false);
		layer_set_visible("Desks", false);
		layer_set_visible("Chairs", false);
		layer_destroy("Collision_As");
	}
}

// FREEPLAY
else {
	if (layer_exists("Collision_So")) {
		layer_set_visible("English_Class_Socratic_Seminar", false);
		layer_destroy("Collision_So");
	}
	layer_destroy("Checkpoint");
	layer_destroy("Collision_Door");
}

// dialogue
if (key_use and (obj_me.place_meeting(obj_me.x, obj_me.y, obj_checkpoint) or obj_me.place_meeting(obj_me.x, obj_me.y, obj_checkpoint_1))) {
	key_use_count++;
	
	// AS I LAY DYING
	if (obj_persistent.as_i_lay_dying) {
		obj_checkpoint.visible = false;
		// next sentence
		if (texts_index < array_length(texts) - 1 and index == string_length(text)) {
			texts_index++; 
			texts_char_index++;
			text = texts[texts_index];
			index = 0;
			key_use_count = 1;
		}
		// skips to end 
		if (key_use_count == 2) {
			index = string_length(text);
		}
	}
	
	// SOCRATIC SEMINAR
	else if (obj_persistent.socratic_seminar) {
		obj_checkpoint_1.visible = false;
		// next sentence
		if (texts_index < array_length(texts_1) - 1 and index == string_length(text)) {
			texts_index++;
			texts_char_index++;
			text = texts_1[texts_index];
			index = 0;
			key_use_count = 1;
		}
		// skips to end 
		if (key_use_count == 2) {
			index = string_length(text);
		}
	}
	alarm[0] = room_speed * 0.05;
}