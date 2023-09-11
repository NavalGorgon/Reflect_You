function sprint_state() {
	if (left)&&(right){
		xSpeed = approach(xSpeed,0,dSpeed)
	}else if (left) {
		xSpeed = approach(xSpeed,-sSpeed,aSpeed);
	}else if (right) {
		xSpeed = approach(xSpeed,sSpeed,aSpeed);
	}else{
		xSpeed = approach(xSpeed,0,dSpeed)
	}

	stam_drain = 0.5;
	var stamina = oInventory.ds_player_info[# 1, 9];

	if(stamina <= 0)||(!sprint)||(xSpeed == 0){
		currentState = states.normal;
		stam_drain = 0;
	}

	if(!place_meeting(x, y+1, oSolid)) {
		currentState = states.jump;
		stam_drain = 0;
	}

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
