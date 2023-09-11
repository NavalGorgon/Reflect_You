function shoot_state() {
	if (x_frame == 7){
		if(direct = 1){
			arrow = instance_create_layer(x+47,y+21,"Instances",oArrow);
		}else{
			arrow = instance_create_layer(x+3,y+21,"Instances",oArrow);
		}
	}

	if (x_frame >= anim_length-0.5) {
		currentState = states.normal;
		x_frame = 0;
	}

	xSpeed = 0;


}
