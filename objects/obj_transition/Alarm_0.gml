if (fade != 1 and darker) {
	fade += .05;
	alarm[0] = room_speed * .05;
}
else if (room = Upstairs and !changed) {
	changed = true;
	darker = false;
	room = Downstairs;
}
else if (!changed) {
	changed = true;
	darker = false;
	room = Upstairs;
}

if (fade != 0 and !darker) {
	fade -= .05;
	alarm[0] = room_speed * .05;
}
else if (!darker) {
	done = true;
	obj_me.can_move = true;
}