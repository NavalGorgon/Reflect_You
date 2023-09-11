 //Buttons

left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check_pressed(vk_up);
down = keyboard_check(vk_up);

sprint = keyboard_check(vk_shift);
block = keyboard_check(ord("R"));
if (keyboard_check_pressed(ord("F"))){
	attack = true;
}
shoot = keyboard_check(ord("S"));
dash = keyboard_check_pressed(ord("D"));

if(keyboard_check_pressed(ord("V"))){
	sheath = !sheath
}



//Switching states
switch currentState {
	case states.normal:
		normal_state();
	break;
	
	case states.jump:
		jump_state();
	break;
	
	case states.attack:
		if((oInventory.ds_equip[# 2, 0] != 0)&&(sheath == false)){
			attack_state();
		}else{
			fist_state();
		}
	break;
	
	case states.block:
		block_state();
	break;
	
	case states.air_attack:
		air_attack_state();
	break;
	
	case states.shoot:
		shoot_state();
	break;
	
	case states.dash:
		dash_state();
	break;
	
	case states.prep:
		prep_state();
	break;
	
	case states.sheath:
		 sheath_state();
	break;
	
	case states.hit:
		hit_state();
	break; 
	
	case states.death:
		death_state();
	break;
	
	case states.sprint:
		sprint_state();
	break;
}

//direction for when you stop moving
if((currentState != states.hit)&&(currentState != states.death)){
	if (right){
		direct = 1;
	}else if (left){
		direct = -1;
	}
}



//hitting doors
var inst = instance_place(x,y,oDoor)
if( inst != noone){
	with(Control){
		if(!doTransition){
			spawn_room = inst.targetRoom;
			doTransition = true;
			spawnX = inst.targetX;
			spawnY = inst.targetY;
		}
	}
}


