key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
key_up = keyboard_check(ord("W")) or keyboard_check(vk_up);
key_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
key_use = keyboard_check_pressed(vk_space);

var move_x = key_right - key_left;
var move_y = key_down - key_up;
walksp = 4;

//left
if (key_left and can_move) {
	sprite_index = spr_me_run_left;
	last_direction = "left";
}

//right
if (key_right and can_move) {
	sprite_index = spr_me_run_right;
	last_direction = "right";
}

//up
if (key_up and can_move) {
	sprite_index = spr_me_run_up;
	last_direction = "up";
	if ((key_left and !key_right) or (!key_left and key_right)) {
		walksp = 3;
	}
}

//down
if (key_down and can_move) {
	sprite_index = spr_me_run_down;
	last_direction = "down";
	if ((key_left and !key_right) or (!key_left and key_right)) {
		walksp = 3;
	}
}

//idle
if (!key_left and !key_right and !key_up and !key_down) {
	if (last_direction = "left") {
		sprite_index = spr_me_idle_left;
	}
	if (last_direction = "right") {
		sprite_index = spr_me_idle_right;
	}
	if (last_direction = "up") {
		sprite_index = spr_me_idle_up;
	}
	if (last_direction = "down") {
		sprite_index = spr_me_idle_down;
	}
}

hsp =  move_x * walksp;
vsp = move_y * walksp;

//horizontal collision
if (place_meeting(x + hsp, y, obj_collision))
{
	while(!place_meeting(x + sign(hsp), y, obj_collision))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

//vertical collision
if (place_meeting(x, y + vsp, obj_collision))
{
	while(!place_meeting(x, y + sign(vsp), obj_collision))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

//using stairs
if ((place_meeting(x, y, obj_stairs_side) or place_meeting(x, y, obj_stairs_top)) and obj_transition.done and key_use) {
	can_move = false;
	obj_transition.darker = true;
	obj_transition.changed = false;
	obj_transition.done = false;
	obj_transition.alarm[0] = room_speed * .05;
}

// don't let this mans move
if (!can_move) {
	hsp = 0;
	vsp = 0;
}

//move
x = x + hsp;
y = y + vsp;