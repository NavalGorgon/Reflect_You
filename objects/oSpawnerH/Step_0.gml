if(!instance_exists(oSlime)){
	noHunter = true;
}else{
	noHunter = false;
}

if((noHunter)&&(SpawnControl.round_end)){
	Round += 1;
	round_end = false;
	alarm[0] = 5*room_speed;
}

hunterNum = Round;
