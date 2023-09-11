function jump_state() {
	//Time for jumping

	ySpeed = approach(ySpeed,fSpeed,gSpeed);

	if (ySpeed < jSpeed/4) && (!keyboard_check(vk_up)){
		ySpeed = jSpeed/4;
	}

	//Double jump
	if ((up)&&(canJump)) {
		ySpeed = jSpeed;
		canJump = false;
	}

	//hitting floor

	if(place_meeting(x, y+ySpeed, oSolid)) {
	    while(!place_meeting(x, y+sign(ySpeed), oSolid))
	        y += sign(ySpeed);
	    ySpeed = 0;
		currentState = states.normal;
	}

	//movement
	if (left)&&(right){
		xSpeed = approach(xSpeed,0,dSpeed)
	}else if (left)&&(xSpeed > -wSpeed) {
		xSpeed = approach(xSpeed,-wSpeed,aSpeed);
	}else if (right)&&(xSpeed < wSpeed) {
		xSpeed = approach(xSpeed,wSpeed,aSpeed);
	}else if (!right)&&(!left){
		xSpeed = approach(xSpeed,0,dSpeed)
	}

	//attack
	if (attack) && (canAttack) {
		currentState = states.air_attack;
		x_frame = 0;
		xSpeed = 0;
		attack = false;
	}

	//dash
	if (dash) {
		currentState = states.dash;
		alarm[0] = room_speed/8;
		x_frame = 3;
	}


}
