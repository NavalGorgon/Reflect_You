function dash_state() {
	xSpeed = 4*wSpeed*direct;

	//hitting walls
	if(place_meeting(x+xSpeed, y, oSolid)) {
	
		yPlus = 0;
		while(place_meeting(x+xSpeed,y-yPlus,oSolid) && yPlus <= abs(4)){
			yPlus += 1;
		}
		if(place_meeting(x+xSpeed,y-yPlus,oSolid)){
			while(!place_meeting(x+sign(xSpeed), y, oSolid))
				x += sign(xSpeed);
			xSpeed = 0;

		}else{
			y -= yPlus;
		}
	}


	//Down slope
	if(!place_meeting(x+xSpeed,y,oSolid)){
		yMinus = 0;
		while(!place_meeting(x+xSpeed,y+yMinus,oSolid) && yMinus <= abs(4)){
			yMinus += 1;
		}
		if(place_meeting(x+xSpeed,y+yMinus,oSolid)){
			y += yMinus;
		}
	}


}
