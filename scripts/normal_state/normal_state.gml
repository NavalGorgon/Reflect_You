function normal_state() {
	var stamina = oInventory.ds_player_info[# 1, 9];
	ySpeed = 0;

	//normal state for the player
	if (left)&&(right){
		xSpeed = approach(xSpeed,0,dSpeed)
	}else if (left) {
		xSpeed = approach(xSpeed,-wSpeed,aSpeed);
	}else if (right) {
		xSpeed = approach(xSpeed,wSpeed,aSpeed);
	}else{
		xSpeed = approach(xSpeed,0,dSpeed)
	}


	//adjusting the hurtbox
	if(xSpeed>0){
		with(hurtbox){
			xOffset = 20;
			yOffset = 8;
			image_xscale = 16;
			image_yscale = 28;
		}
	}else if(xSpeed<0){
		with(hurtbox){
			xOffset = 14;
			yOffset = 8;
			image_xscale = 16;
			image_yscale = 28;
		}
	}else{
		with(hurtbox){
			xOffset = 17;
			yOffset = 6;
			image_xscale = 17;
			image_yscale = 30;
		}
	}



	//Jumping

	canJump = oInventory.ds_skills[# 0, 0];
	canAttack = true;

	if up {
		x_frame = 0;
		currentState = states.prep;
	}

	if(!place_meeting(x, y+1, oSolid)) {
		currentState = states.jump;
	}

	if (attack) {
		currentState = states.attack;
		x_frame = 0;
		attack = false;
	}

	if (block)&&(stamina > 0) {
		stam_drain += 1;
		currentState = states.block;
		x_frame = 0;
	}

	if (dash) {
		currentState = states.dash;
		alarm[0] = room_speed/8;
		x_frame = 3;
	}

	if(sprint)&&(stamina > 0){
		currentState = states.sprint;
		x_frame = 0;
	}

	if (shoot && (oInventory.ds_equip[# 1, 0] != 0)) {
		currentState = states.shoot;
		x_frame = 0;
	}

	if(keyboard_check_pressed(ord("V"))){
		currentState = states.sheath;
		if(sheath == false){
			x_frame = 0;
		}else{
			x_frame = 4;
		}
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
