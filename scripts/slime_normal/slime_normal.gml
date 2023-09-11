function slime_normal() {
	if(distance_to_object(oPlayer) <= 0.5){
		if(oPlayer.x > x){
			direct = 1;
		}else{
			direct = -1;
		}
		currentState = states.attack;
	}


}
