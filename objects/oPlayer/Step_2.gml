 //
x += xSpeed;
y += ySpeed;

//Stamina
var max_stam = oInventory.ds_player_info[# 1, 8];
var stamina = oInventory.ds_player_info[# 1, 9];

stamina -= stam_drain

if(stam_drain == 0)&&(regen == false)&&(stamina != max_stam){
	stam_count += 1;
}else{
	stam_count = 0;
}

if(stam_count == 2*room_speed){
	regen = true;
}

if(regen){
	
	if((stamina+stam_regen) < max_stam){
		stamina += stam_regen;
	}else{
		stamina = max_stam;
		regen = false;
	}
	
}

if(stam_drain != 0){
	regen = false;
}
		

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
		with(oHurtboxE){
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
var armor_factor = 0.12*(oInventory.ds_player_info[# 1, 6])/100;
if(hit){                             
	xSpeed = hitBy.xHit;
	ySpeed = hitBy.yHit;
	hitStun = hitBy.hitStun;
	oInventory.ds_player_info[# 1, 2] -= hitBy.damage*(1 - armor_factor);
	direct = hitBy.owner.direct*-1;
	hit = false;
	currentState = states.hit;
}

health_ = oInventory.ds_player_info[# 1, 2];
oInventory.ds_player_info[# 1, 9] = stamina;