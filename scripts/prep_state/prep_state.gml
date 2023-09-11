function prep_state() {
	if (x_frame >= anim_length - 1){
		x_frame = 0;
		currentState = states.jump;
		ySpeed = jSpeed;
	}


}
