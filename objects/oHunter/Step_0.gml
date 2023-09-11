//Switching states
switch currentState {
	case states.hit:
		hit_state();
	break;
	
	case states.death:
		slime_death();
	break;
	
	case states.attack:
		slime_attack();
	break;
	
	case states.normal:
		hunter_normal();
	break;
	
	case states.jump:
		enemy_fall();
	break;
}

//falling
if (!place_meeting(x,y+1,oSolid)){
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