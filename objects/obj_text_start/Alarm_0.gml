if (decreasing) {
	alpha -= .1;
	if (alpha == 0) {
		decreasing = false;
	}
}
else {
	alpha += .1;
	if (alpha == 1) {
		decreasing = true;
	}
}
alarm[0] = room_speed * 0.07;