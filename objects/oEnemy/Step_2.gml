x += xSpeed;
y += ySpeed;

//hurtbox
with(hurtbox){
	x = other.x + xOffset;
	y = other.y + yOffset;
}

//hitbox
if(hitbox != -1){
	with(hitbox){
		x = other.x + xOffset;
		y = other.y + yOffset;
		
		//check to see if the enemy hurtbox is touching your hitbox
		with(oHurtbox){
			if(place_meeting(x,y,other)){
				//checking collision from the hitbox object
				with(other){
					//check to see if your target is on the ignore list
					//if it is on the ignore list, don't hit it again
					for(i = 0; i < ds_list_size(ignoreList); i ++){
						if(ignoreList[|i] = other.owner){
					  		ignore = true;
							break;
						}
					}
					//if it is NOT on the ignore list, hit it, and add it to
					//the ignore list
					if(!ignore){
						other.owner.hit = true;
						other.owner.hitBy = id;
						owner.hitLanded = true;
						ds_list_add(ignoreList,other.owner);
					}
				}
			}
		}
	}
}

//get hit
if((hit)&&(currentState != states.death)&&(instance_exists(hitBy))){                             
	xSpeed = hitBy.xHit;
	ySpeed = hitBy.yHit;
	hitStun = hitBy.hitStun;
	health_ = health_ - hitBy.damage;
	direct = hitBy.owner.direct*-1;
	hit = false;
	currentState = states.hit;
}