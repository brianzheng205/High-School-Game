// fade to game
draw_set_alpha(fade);
draw_set_color(c_black);
if (instance_exists(obj_me)) {
	draw_rectangle(obj_me.x - 960, obj_me.y - 540, obj_me.x + 960, obj_me.y + 540, false);
}