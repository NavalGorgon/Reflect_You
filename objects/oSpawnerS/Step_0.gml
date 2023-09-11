if(!instance_exists(oSlime)){
	noSlime = true;
}else{
	noSlime = false;
}

if((noSlime)&&(SpawnControl.round_end)){
	Round += 1;
	round_end = false;
	alarm[0] = 5*room_speed;
}

slimeNum = Round*2;
