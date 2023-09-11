x += xSpeed;
y += ySpeed;

//hitbox
if(hitbox != -1){
	with(hitbox){
		x = other.x + xOffset;
		y = other.y + yOffset;
		
		//check to see if the enemy hurtbox is touching your hitbox
		with(oHurtboxE){
			if(place_meeting(x,y,other)){
				//checking collision from the hitbox object
				with(other){
						other.owner.hit = true;
						other.owner.hitBy = id;
						life = 0;
				}
			}
		}
	}
}else{
	instance_destroy();
}