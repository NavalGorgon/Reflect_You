function enemy_normal() {
	if(distance_to_object(oPlayer) < 200){
		x = approach(x, oPlayer.x, wSpeed);
	}

	if(distance_to_object(oPlayer) < 17){
		currentState = states.attack;
	}


}
