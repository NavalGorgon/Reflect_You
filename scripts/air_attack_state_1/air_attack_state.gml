function air_attack_state() {
	//attack state
	var frm = 60/12;
	canAttack = false;


	//hitting floor
	if(place_meeting(x, y+ySpeed, oSolid)) {
	    while(!place_meeting(x, y+sign(ySpeed), oSolid))
	        y += sign(ySpeed);
	    ySpeed = 0;
		x_frame = 0;
		currentState = states.normal;
		alarm[1] = -1
		instance_destroy(hitbox)
		currentAttack = attacks.first;
	}

	if (currentAttack != attacks.third) {

		ySpeed = 0

		if (x_frame >= anim_length - 0.5) {
			currentState = states.jump;
			currentAttack = attacks.first;
			x_frame = 0;
		}
	}

	var weapon = oInventory.ds_equip[# 2, 0];
	var dmg = oInventory.ds_items_info[# 3, weapon];

	switch(currentAttack){
		case attacks.first:
			//create hitbox on the right frame
			if(floor(x_frame) == 1 && hitbox == -1){
			
				hitbox = hitbox_create(46,22,2,4,frm,0,-2,30,dmg);
			
				if(!audio_is_playing(sword_swing_5)){
				audio_play_sound(sword_swing_5,1,false);
				}
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length - 2)){
				currentAttack = attacks.second;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				attack = false;
			}
		break;
	
		case attacks.second:
			//create hitbox on the right frame
			if(floor(x_frame) == 0 && hitbox == -1){
				if(direct == 1){
					hitbox = hitbox_create(31,31,18,4,frm,0,-2,30,dmg);
				}else{
					hitbox = hitbox_create(31,31,1,4,frm,0,-2,30,dmg);
				}
				audio_play_sound(sword_swing_4,1,false);
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length - 2)){
				currentAttack = attacks.third;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				attack = false;
			}
		break;
	
		case attacks.third:
			//create hitbox on the right frame
			if(floor(x_frame) == 2 && hitbox == -1){
				ySpeed = 3;
				alarm[1] = 2*room_speed;
				if(direct == 1){
					xSpeed = 3;
					hitbox = hitbox_create(15,12,21,19,2*room_speed,5*direct,5,30,2*dmg);
				}else{
					xSpeed = -3;
					hitbox = hitbox_create(15,12,14,20,2*room_speed,5*direct,5,30,2*dmg);
				}
				audio_play_sound(sword_swing_1,1,false);
			}
		break;
	}


}
