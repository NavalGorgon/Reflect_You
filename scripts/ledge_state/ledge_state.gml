function ledge_state() {
	xSpeed = 0;
	ySpeed = 0;

	if(keyboard_check_pressed(ord("P"))){
		x = x - 5*direct;
		currentState = states.jump;
	}


}
