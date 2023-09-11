function enemy_attack() {
	if(distance_to_object(oPlayer) > 17){
		currentState = states.normal;
	}

	if(image_index == 2){
		hitbox = hitbox_create(15,20,35,4,5,0,0,0,1);
	} 


}
