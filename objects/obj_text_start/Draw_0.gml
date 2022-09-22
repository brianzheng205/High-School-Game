centerx = 683;
centery = 384;
draw_set_color(c_gray);
draw_set_alpha(0.8);
draw_rectangle(centerx - 250, centery - 300, centerx + 250, centery + 300, false);

draw_set_font(font_main_big);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(1);
if (first_screen) {
	layer_set_visible("Animations", false);
	draw_text(centerx, centery - 290, "EHTHS: THE GAME");
	if (index == 0) {
		draw_text(centerx, centery + 15, options[1]);
		draw_set_alpha(alpha);
		draw_text(centerx, centery - 58, options[0]);
	}
	else {
		draw_text(centerx, centery - 58, options[0]);
		draw_set_alpha(alpha);
		draw_text(centerx, centery + 15, options[1]);
	}
	draw_set_alpha(1);
	draw_set_font(font_main);
	draw_set_color(c_white);
	draw_text(centerx, centery + 280, "PRESS ENTER OR SPACE TO SELECT");
}
else if (select_level_screen) {
	layer_set_visible("Animations", false);
	draw_text(centerx, centery - 290, "LEVEL SELECT");
	draw_set_font(font_main_medium);
	if (index_2 == 0) {
		draw_text(centerx, centery - 18, options_2[1]);
		draw_text(centerx, centery + 12, options_2[2]);
		draw_set_alpha(alpha);
		draw_text(centerx, centery - 48, options_2[0]);
	}
	else if (index_2 == 1) {
		draw_text(centerx, centery - 48, options_2[0]);
		draw_text(centerx, centery + 12, options_2[2]);
		draw_set_alpha(alpha);
		draw_text(centerx, centery - 18, options_2[1]);
	}
	else {
		draw_text(centerx, centery - 48, options_2[0]);
		draw_text(centerx, centery - 18, options_2[1]);
		draw_set_alpha(alpha);
		draw_text(centerx, centery + 12, options_2[2]);
	}
	draw_set_alpha(1);
	draw_set_color(c_red);
	draw_text(centerx, centery + 72, options_2[3]);
}
else if (how_to_play_screen) {
	layer_set_visible("Animations", true);
	draw_set_font(font_main_medium);
	draw_set_color(c_black);
	draw_text(centerx - 111, centery - 215, "W");
	draw_text(centerx - 173, centery - 152, "A");
	draw_text(centerx - 111, centery - 152, "S");
	draw_text(centerx - 49, centery - 152, "D");
	
	draw_set_font(font_main);
	draw_set_color(c_white);
	draw_text(centerx, centery - 290, "USE WASD OR THE ARROW KEYS TO MOVE");
	draw_text(centerx, centery - 70, "USE SPACE TO INTERACT WITH CHECKPOINTS");
	draw_set_alpha(1);
	draw_set_font(font_main);
	draw_set_color(c_white);
	draw_text(centerx, centery + 280, "PRESS ENTER OR SPACE TO CONTINUE");
}

// fade to game
draw_set_alpha(fade);
draw_set_color(c_black);
draw_rectangle(0, 0, 1366, 768, false);