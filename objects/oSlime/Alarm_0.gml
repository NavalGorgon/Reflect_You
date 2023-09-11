 
if(currentState = states.normal){
	idle = !idle;
	if(idle){
		xSpeed = 0;
	}else{
		direct = -1*direct;
		xSpeed = 1*direct;
	}
}




alarm[0] = random_range(1,3)*room_speed;