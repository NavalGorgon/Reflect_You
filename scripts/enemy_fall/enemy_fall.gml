function enemy_fall() {
	ySpeed = approach(ySpeed,fSpeed,gSpeed);

	//Landing
	if(place_meeting(x, y+ySpeed, oSolid)) {
	    while(!place_meeting(x, y+sign(ySpeed), oSolid))
	        y += sign(ySpeed);
	    ySpeed = 0;
		xSpeed = 0;
		currentState = states.normal;
	}


}
