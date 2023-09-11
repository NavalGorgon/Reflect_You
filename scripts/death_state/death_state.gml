function death_state() {
	xSpeed = 0;
	ySpeed = approach(ySpeed,fSpeed,gSpeed);
	//Landing
	if(place_meeting(x, y+ySpeed, oSolid)) {
	    while(!place_meeting(x, y+sign(ySpeed), oSolid)){
	        y += sign(ySpeed);
		}
	    ySpeed = 0;
	}

	if(x_frame >= anim_length - 1){
		Control.died = true;
	}

	with(hurtbox){
		instance_destroy();
	}


}
