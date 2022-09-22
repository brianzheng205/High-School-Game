draw_set_font(font_main);
draw_set_halign(fa_left);
draw_set_color(c_gray);
draw_set_alpha(0.8);
length = string_length(text) * (450 / 58);
height = 20;
if (length > 450) {
	height = 20 * ceil(length / 450);
	length = 450;
}
if (text_visible) {
	if ((obj_persistent.socratic_seminar and texts_1_ppl[texts_char_index] == "") or
	(obj_persistent.as_i_lay_dying and texts_ppl[texts_char_index] == "")) {
		draw_rectangle(x, y, x + length, y + height, false);
	}
	else {
		draw_rectangle(x, y - 20, x + length, y + height, false);
	}
}
draw_set_color(c_white);
draw_set_alpha(1);

lines = ceil(index / 58);
if (text_visible) {
	if (obj_persistent.socratic_seminar) {
		draw_text(x, y - 20, texts_1_ppl[texts_char_index]);
	}
	else if (obj_persistent.as_i_lay_dying) {
		draw_text(x, y - 20, texts_ppl[texts_char_index]);
	}
	while (lines > 1) {
		current_line = (ceil(index / 58) - lines) + 1;
		draw_text(x, y + 20 * (current_line - 1), string(string_copy(text, current_line * 58 - 57, 58)));
		lines--;
	}
	end_length = index % 58;
	if (end_length == 0 and index != 0) {
		end_length = 58;
	}
	draw_text(x, y + 20 * (ceil(index / 58) - 1), string(string_copy(text, ceil(index / 58) * 58 - 57, end_length)));
}

/*words = string_count(" ", text) + 1;
count = 0;
spaces = [];
for (x = 0; x < index; x++) {
	if (string_char_at(text, x) == " ") {
		count++;
		//show_debug_message(count);
		if (count % 11 == 0) {
			array_push(spaces, x + 1);
		}
	}
}
lines = ceil(words / 11);
current_line = 1;
lines_left = array_length(spaces);
while (lines_left > 0) {
	if (current_line != 1) {
		line_length = spaces[current_line - 1] - spaces[current_line - 2];
	}
	else {
		line_length = spaces[current_line - 1];
	}
	draw_text(x, y + 20 * (current_line - 1), string(string_copy(text, spaces[current_line - 2] + 1, line_length)));
	current_line++;
	lines_left--;
}
if (array_length(spaces) != 0) {
	end_length = index - spaces[lines - 2];
}
else {
	end_length = index;
}
if (end_length == 0 and index != 0) {
	end_length = 11;
}*/
//draw_text(x, y + 20 * (ceil(index / 11) - 1), string(string_copy(text, ceil(index / 11) * 11 - 10, end_length)));
//draw_text(x, y + 20 * floor( / 58), string(string_copy(text, 59, 116)));