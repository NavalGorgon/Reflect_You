function hit_state() {
	//hit state
	if(place_meeting(x,y+1,oSolid)){
		xSpeed = approach(xSpeed,0,0.3);
	}

	if(!place_meeting(x, y+ySpeed, oSolid)){
		ySpeed = approach(ySpeed,fSpeed,gSpeed);
	}

	//Landing
	if(place_meeting(x, y+ySpeed, oSolid)) {
	    while(!place_meeting(x, y+sign(ySpeed), oSolid)){
	        y += sign(ySpeed);
		}
	    ySpeed = 0;
	}



	hitStun --;

	if(hitStun <= 0){
		currentState = states.normal;
	}

	if (health_ <= 0) {
		currentState = states.death;
		x_frame = 0;
	
	}


}
