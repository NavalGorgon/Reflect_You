function hunter_normal() {
	if(oPlayer.x > x){
		xSpeed = 1;
		direct = 1;
	}else{
		xSpeed = -1;
		direct = -1;
	}

	if(distance_to_object(oPlayer) <= 0.5){
		if(oPlayer.x > x){
			direct = 1;
		}else{
			direct = -1;
		}
		currentState = states.attack;
	}


}
