// if sentence not keep going and don't let me move
if (index < string_length(text)) {
	text_visible = true;
	index++;
	obj_me.visible = false;
	obj_me.can_move = false;
	if (obj_persistent.as_i_lay_dying) {
		layer_set_visible("Player_sitting", true);
	}
	else if (obj_persistent.socratic_seminar) {
		layer_set_visible("sitting_me", true);
	}
	alarm[0] = room_speed * 0.05;
}
// if done and last sentence, let me move
else if (obj_persistent.as_i_lay_dying) {
	if (texts_index == array_length(texts) - 1) {
		layer_set_visible("Player_sitting", false);
		obj_me.visible = true;
		obj_me.can_move = true;
		alarm[1] = room_speed * 3;
	}
}
else if (obj_persistent.socratic_seminar) {
	if (texts_index == array_length(texts_1) - 1) {
		layer_set_visible("sitting_me", false);
		obj_me.visible = true;
		obj_me.can_move = true;
		alarm[1] = room_speed * 3;
	}
}