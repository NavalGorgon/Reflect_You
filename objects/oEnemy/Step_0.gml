 //Switching states
switch currentState {
	
	case states.normal:
		enemy_normal();
		sprite_index = sEnemy;
	break;
	
	case states.hit:
		hit_state();
		sprite_index = sEnemy;
	break;

	case states.jump:
		enemy_fall();
		sprite_index = sEnemy;
	break;
	
	case states.attack:
		sprite_index = sEnemy_Attack;
		enemy_attack();
	break;
}

//falling
if (!place_meeting(x,y+1,oSolid)) && (currentState != states.hit){
	currentState = states.jump;
}

//hitting walls
if(place_meeting(x+xSpeed, y, oSolid)) {
    while(!place_meeting(x+sign(xSpeed), y, oSolid))
        x += sign(xSpeed);
    xSpeed = 0;
}

if(place_meeting(x+xSpeed, y, oBarrier)) {
    while(!place_meeting(x+sign(xSpeed), y, oBarrier))
        x += sign(xSpeed);
    xSpeed = 0;
}