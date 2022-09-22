if (decreasing) {
	image_alpha -= .03;
	if (image_alpha == 0) {
		decreasing = false;
	}
}
else {
	image_alpha += .03;
	if (image_alpha == 0.3) {
		decreasing = true;
	}
}
alarm[0] = room_speed * 0.1;